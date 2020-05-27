//
//  WeatherEndPoints.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 27/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import Foundation

enum WeatherEndPoints: EndPoint {
  case weatherForCity(_ city: String)
  case forecastForCity(_ city: String)
  
  var method: HTTPMethod {
    switch self {
    case .weatherForCity, .forecastForCity: return .get
    }
  }
  
  var path: String {
    switch self {
    case .weatherForCity: return "weather"
    case .forecastForCity: return "forecast"
    }
  }
  
  var parameters: Parameters {
    switch self {
    case let .weatherForCity(city): return ["q":city]
    case let .forecastForCity(city): return ["q":city]
    }
  }
  
}
