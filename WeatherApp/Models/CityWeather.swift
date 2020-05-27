//
//  CityWeather.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 27/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import Foundation

struct CityWeather {
  let weather: [Weather]
  let name: String
  let temp: Temp
  let wind: Wind
}

extension CityWeather: Decodable {
  enum CodingKeys: String, CodingKey {
    case weather
    case name
    case temp = "main"
    case wind
  }
}
