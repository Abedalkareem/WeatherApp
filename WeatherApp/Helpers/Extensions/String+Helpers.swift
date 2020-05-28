//
//  String+Helpers.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 28/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import Foundation

extension String {
  var localized: String {
    let bundle = Bundle(for: AppDelegate.self)
    return bundle.localizedString(forKey: self, value: "", table: nil)
  }
}
