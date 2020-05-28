//
//  HourWeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 28/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import UIKit

class HourWeatherCollectionViewCell: UICollectionViewCell {
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var weatherImageView: UIImageView!
  @IBOutlet weak var weatherLabel: AppLabel!
  
  // MARK: - Setup

  func setupWith(_ item: CityWeatherViewModel) {
    weatherImageView.image = item.image
    weatherLabel.text = item.weather
  }
}
