//
//  Time.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 27/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import Foundation

class AppTime {
  func getCurrentTime(with timeZoneInt: Int?) -> Time {
    var calendar = Calendar(identifier: Calendar.current.identifier)
    if let timeZoneInt = timeZoneInt,
      let timeZone = TimeZone(secondsFromGMT: timeZoneInt) {
      calendar.timeZone = timeZone
    }
    let hour = calendar.component(.hour, from: Date())
    switch hour {
    case 0...12:
      return .morning
    case 12...17:
      return .afternoon
    default:
      return .night
    }
  }
  
}

enum Time {
  case morning
  case afternoon
  case night
}
