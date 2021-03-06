//
//  CityWeatherViewModel.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 27/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import UIKit

class CityWeatherViewModel {
  
  let condition: WeatherConditions
  let name: String
  let description: String
  let minMaxWeather: String
  let weather: String
  let windSpeed: String
  let timezone: Int?
  let date: Date

  var image: UIImage {
    switch condition {
    case .clouds:
      return UIImage(image: .cloudBlue)
    case .clear:
      return UIImage(image: .sun)
    case .snow:
      return UIImage(image: .snowy)
    case .rain, .drizzle:
      return UIImage(image: .rainy)
    case .thunderstorm:
      return UIImage(image: .thunderstorm)
    case .mist:
      return UIImage(image: .foog)
    case .dust:
      return UIImage(image: .wind)
    case .fog:
      return UIImage(image: .foog)
    case .sand:
      return UIImage(image: .foog)
    case .haze:
      return UIImage(image: .foog)
    case .unknown:
      return UIImage(image: .unknown)
    }
  }
  
  init(cityWeather: CityWeather) {
    condition = cityWeather.weather.first?.condition ?? .unknown
    name = cityWeather.name ?? ""
    description = cityWeather.weather.first?.description ?? ""
    minMaxWeather = "\(cityWeather.temp.min) - \(cityWeather.temp.max)"
    weather = "\(cityWeather.temp.value)"
    windSpeed = "\(cityWeather.wind.speed)"
    timezone = cityWeather.timezone
    date = cityWeather.date
  }
  
}
