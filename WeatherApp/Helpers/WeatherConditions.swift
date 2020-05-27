//
//  WeatherConditions.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 27/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import Foundation

enum WeatherConditions: String, Decodable {
  case clouds = "Clouds"
  case clear = "Clear"
  case snow = "Snow"
  case rain = "Rain"
  case drizzle = "Drizzle"
  case thunderstorm = "Thunderstorm"
  case mist = "Mist"
  case dust = "Dust"
  case fog = "Fog"
  case sand = "Sand"
  case haze = "Haze"
  case unknown
}
