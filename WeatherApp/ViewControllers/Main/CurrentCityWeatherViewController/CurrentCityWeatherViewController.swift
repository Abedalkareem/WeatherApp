//
//  CurrentCityWeatherViewController.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 28/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class CurrentCityWeatherViewController: UIViewController {
  
  // MARK: - IBOutlets
  
  @IBOutlet private weak var timeView: TimeView!
  @IBOutlet private weak var cityNameLabel: AppLabel!
  @IBOutlet private weak var tableView: UITableView!
  
  // MARK: Private properties
  
  var viewModel: CurrentCityWeatherViewModel!
  
  // MARK: View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    viewModel = CurrentCityWeatherViewModel(services: WeatherServices(fetcher: Fetcher(networking: HttpClient())), locationProvider: LocationHelper())
    
    viewModel.requestAuthorization()
    
    viewModel.city.bind(to: cityNameLabel.rx.text)
    
    timeView.setCurrentTime()
    
    tableView.register(DayWeatherTableViewCell.self)
    viewModel.status
      .bind(to: tableView.rx.items(cellType: DayWeatherTableViewCell.self)) { _, model, cell in
        cell.setupWith(item: model)
    }
  }
  
  static func instance() -> CurrentCityWeatherViewController {
    let viewController = UIStoryboard.create(storyboard: .main,
                                             controller: CurrentCityWeatherViewController.self)
    return viewController
  }
}
