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
  case forecastForLatLon(_ lat: Double, _ lon: Double)
  
  var method: HTTPMethod {
    switch self {
    case .weatherForCity, .forecastForLatLon: return .get
    }
  }
  
  var path: String {
    switch self {
    case .weatherForCity: return "weather"
    case .forecastForLatLon: return "forecast"
    }
  }
  var parameters: Parameters {
    switch self {
    case let .weatherForCity(city): return ["q":city, "units": "metric"]
    case let .forecastForLatLon(lat, lon): return ["lat": lat, "lon": lon, "units": "metric"]
    }
  }
  
}
