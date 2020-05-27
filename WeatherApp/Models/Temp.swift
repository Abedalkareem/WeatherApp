//
//  Temp.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 27/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import Foundation

struct Temp {
  let min: Double
  let max: Double
}

extension Temp: Decodable {
  enum CodingKeys: String, CodingKey {
    case min = "temp_min"
    case max = "temp_max"
  }
}
