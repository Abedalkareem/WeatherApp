//
//  UIImage+Helpers.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 27/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import UIKit

extension UIImage {
  convenience init(image: Images) {
    self.init(named: image.rawValue, in: Bundle(for: AppDelegate.self), with: nil)!
  }
}
