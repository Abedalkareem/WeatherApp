//
//  MainViewModel.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 27/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import RxSwift
import RxCocoa

class MainViewModel: ViewModelType, Loadable, ErrorEmitable {
  
  // MARK: - Properties
  
  var loading: Observable<Loading>!
  var loadingTrigger: AnyObserver<Loading>!
  
  var error: Observable<Error>!
  var errorTrigger: AnyObserver<Error>!
  
  var disposeBag = DisposeBag()
  
  var status: Observable<[CityWeatherViewModel]>
  
  var searchText = BehaviorSubject(value: "")
  
  // MARK: Private properties
  
  private let services: WeatherServices
  private var statusTrigger: AnyObserver<[CityWeatherViewModel]>
  
  init(services: WeatherServices) {
    self.services = services
    
    let behaviorSubject = BehaviorSubject<Loading>(value: .init(true))
    loading = behaviorSubject.asObservable()
    loadingTrigger = behaviorSubject.asObserver()
    
    let errorPublishSubject = PublishSubject<Error>()
    error = errorPublishSubject.asObservable()
    errorTrigger = errorPublishSubject.asObserver()
    
    let statusPublishSubject = PublishSubject<[CityWeatherViewModel]>()
    status = statusPublishSubject.asObservable()
    statusTrigger = statusPublishSubject.asObserver()
    
    observeForSearchText()
  }
  
  func observeForSearchText() {
    searchText
      .map({ $0.components(separatedBy: ",")
        .filter({ !$0.trimmingCharacters(in: .whitespaces).isEmpty }) })
      .debounce(RxTimeInterval.seconds(2), scheduler: MainScheduler.asyncInstance)
      .emitTo(loadingTrigger, value: .init(true, type: .fullScreen))
      .flatMap({ cities -> Observable<[String]> in
        guard cities.count >= 3 && cities.count < 7 else {
          return Observable.empty()
        }
        return Observable.just(cities)
      })
      .flatMap({ [unowned self] cities in
        Observable.zip(cities.map({ self.services.weatherForCity($0) }))
          .emitErrorTo(self.errorTrigger)
          .catchError()
      })
      .map({ $0.map(CityWeatherViewModel.init(cityWeather:)) })
      .emitTo(loadingTrigger, value: .init(false, type: .fullScreen))
      .bind(to: statusTrigger)
      .disposed(by: disposeBag)
  }
}
