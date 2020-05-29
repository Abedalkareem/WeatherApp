//
//  UIScrollView+Helpers.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 28/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import UIKit

extension UIScrollView {
  var currentPage: Int {
    return Int(round(contentOffset.x / bounds.width))
  }
}
