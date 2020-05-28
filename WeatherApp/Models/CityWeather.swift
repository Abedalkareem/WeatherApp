//
//  CityWeather.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 27/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import Foundation

struct CityWeather {
  let date: Date
  let weather: [Weather]
  let name: String?
  let temp: Temp
  let wind: Wind
  let timezone: Int?
}

extension CityWeather: Decodable {
  enum CodingKeys: String, CodingKey {
    case date = "dt"
    case weather
    case name
    case temp = "main"
    case wind
    case timezone
  }
}
