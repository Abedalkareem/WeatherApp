//
//  Weather.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 27/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import Foundation

struct Weather {
  let condition: WeatherConditions?
  let description: String
}

extension Weather: Decodable {
  enum CodingKeys: String, CodingKey {
    case condition = "main"
    case description
  }
}
