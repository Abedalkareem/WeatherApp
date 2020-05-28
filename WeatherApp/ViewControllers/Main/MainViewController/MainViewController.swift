//
//  MainViewController.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 27/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  // MARK: - IBOutlets
  
  @IBOutlet private weak var timeView: TimeView!
  @IBOutlet private weak var appInput: AppInput!
  @IBOutlet private weak var citiesView: CitiesView!
  
  // MARK: - Private properties
  
  private var viewModel: MainViewModel!
  
  // MARK: View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewModel = MainViewModel(services: WeatherServices(fetcher: Fetcher(networking: HttpClient())))
    
    bindTextToSearchText()
    observeForStatus()
    bindCurrentPageToCurrentTime()
    observeForAppInputAction()
  }
  
  private func bindTextToSearchText() {
    appInput.text.orEmpty
      .bind(to: viewModel.searchText)
  }
  
  private func observeForStatus() {
    viewModel.status
      .subscribe(onNext: { cities in
        self.citiesView.add(items: cities)
      })
  }
  
  private func bindCurrentPageToCurrentTime() {
    citiesView.currentPage
      .withLatestFrom(viewModel.status, resultSelector: { $1[$0!].timezone })
      .bind(to: timeView.rx.currentTime)
  }
  
  private func observeForAppInputAction() {
    appInput.actionDidPress {
      let viewController = CurrentCityWeatherViewController.instance()
      self.present(viewController, animated: true, completion: nil)
    }
  }
  
  // MARK: - Instance
  
  static func instance() -> MainViewController {
    let viewController = UIStoryboard.create(storyboard: .main,
                                             controller: MainViewController.self)
    return viewController
  }
}
