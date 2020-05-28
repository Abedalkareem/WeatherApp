//
//  MainViewController.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 27/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import UIKit

class MainViewController: BaseViewModelController<MainViewModel> {
  
  // MARK: - IBOutlets
  
  @IBOutlet private weak var timeView: TimeView!
  @IBOutlet private weak var appInput: AppInput!
  @IBOutlet private weak var citiesView: CitiesView!
  
  // MARK: - Private properties
  
  // MARK: View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    bindTextToSearchText()
    observeForStatus()
    bindCurrentPageToCurrentTime()
    observeForAppInputAction()
  }
  
  private func bindTextToSearchText() {
    appInput.text.orEmpty
      .bind(to: viewModel.searchText)
      .disposed(by: disposeBag)
  }
  
  private func observeForStatus() {
    viewModel.status
      .subscribe(onNext: { cities in
        self.citiesView.add(items: cities)
      })
      .disposed(by: disposeBag)
  }
  
  private func bindCurrentPageToCurrentTime() {
    citiesView.currentPage
      .withLatestFrom(viewModel.status, resultSelector: { $1[$0!].timezone })
      .bind(to: timeView.rx.currentTime)
      .disposed(by: disposeBag)
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
