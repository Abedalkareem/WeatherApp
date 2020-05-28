//
//  JSONReader.swift
//  WeatherAppTests
//
//  Created by abedalkareem omreyh on 29/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import Foundation

class JSONReader {
  
  func readJSONFileWith(name: String) -> Data? {
    
    guard let path = Bundle(for: type(of: self))
      .path(forResource: name, ofType: "json") else {
        return nil
    }
    
    return try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
  }
}
