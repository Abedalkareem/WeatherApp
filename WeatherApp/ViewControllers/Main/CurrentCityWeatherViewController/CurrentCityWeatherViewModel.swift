//
//  CurrentCityWeatherViewModel.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 28/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CurrentCityWeatherViewModel: ViewModelType, Loadable, ErrorEmitable {
  
  // MARK: - Properties
  
  var loading: Observable<Loading>!
  var loadingTrigger: AnyObserver<Loading>!
  
  var error: Observable<Error>!
  var errorTrigger: AnyObserver<Error>!
  
  var disposeBag = DisposeBag()
  
  var status: Observable<[String: [CityWeatherViewModel]]>
  var city: Observable<String>
  
  // MARK: Private properties
  
  private let services: WeatherServices
  private let locationProvider: LocationProvider
  private var statusTrigger: AnyObserver<[String: [CityWeatherViewModel]]>
  private var cityTrigger: AnyObserver<String>
  
  init(services: WeatherServices, locationProvider: LocationProvider) {
    self.services = services
    self.locationProvider = locationProvider
    
    let behaviorSubject = BehaviorSubject<Loading>(value: .init(true))
    loading = behaviorSubject.asObservable()
    loadingTrigger = behaviorSubject.asObserver()
    
    let errorPublishSubject = PublishSubject<Error>()
    error = errorPublishSubject.asObservable()
    errorTrigger = errorPublishSubject.asObserver()
    
    let statusPublishSubject = PublishSubject<[String: [CityWeatherViewModel]]>()
    status = statusPublishSubject.asObservable()
    statusTrigger = statusPublishSubject.asObserver()
    
    let cityPublishSubject = PublishSubject<String>()
    city = cityPublishSubject.asObservable()
    cityTrigger = cityPublishSubject.asObserver()
    
    observeForUserCurrentLocation()
    observeForUserAddress()
  }
  
  private func observeForUserCurrentLocation() {
    locationProvider.currentUserLocation
      .filter({ $0 != nil })
      .take(1)
      .emitTo(loadingTrigger, value: .init(true, type: .fullScreen))
      .flatMap({ location in
        self.services.forecastForLatLon(location!.coordinate.latitude,
                                        location!.coordinate.longitude)
          .emitErrorTo(self.errorTrigger)
          .catchError()
      })
      .map({ $0.map(CityWeatherViewModel.init(cityWeather:)) })
      .map({ Dictionary(grouping: $0, by: {
        return $0.date.dayOfWeek()
      })})
      .emitTo(loadingTrigger, value: .init(false, type: .fullScreen))
      .bind(to: statusTrigger)
      .disposed(by: disposeBag)
  }
  
  private func observeForUserAddress() {
    locationProvider.currentUserLocation
      .filter({ $0 != nil })
      .take(1)
      .flatMap({ self.locationProvider.getAddressFrom(location: $0!) })
      .map({ $0.locality! })
      .bind(to: cityTrigger)
      .disposed(by: disposeBag)
  }
  
  // MARK: - Public
  
  func requestAuthorization() {
    locationProvider.requestAuthorization()
  }
}
