//
//  Constants.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 26/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import Foundation

enum Constants {
  
  enum urls {
    static let host = ""
    static let scheme = "http"
  }
  
  enum errors {
    static var nilData = NSError(domain: "", code: -20, userInfo: [:])
    static var jsonSerializingFailure = NSError(domain: "", code: -30, userInfo: [:])
  }
  
  enum strings {
    static let key = "$$amato3a"
  }
  
  enum ints { }
  
}
