//
//  AppLabel.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 27/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import Foundation

import UIKit

@IBDesignable
class AppLabel: UILabel {
  
  @IBInspectable var localizeKey: String = "" {
    didSet {
      let bundle = Bundle(for: type(of: self))
      self.text = bundle.localizedString(forKey: localizeKey, value: "", table: nil)
    }
  }
  
  @IBInspectable var isAppLogo: Bool = false {
    didSet {
      font = .appLogo
    }
  }
  
  @IBInspectable var titleFont: Int = 0 {
    didSet {
      guard titleFont != titleFonts.count else {
        return
      }
      font = titleFonts[titleFont]
    }
  }
  
  @IBInspectable var bodyFont: Int = 0 {
    didSet {
      guard bodyFont != bodyFonts.count else {
        return
      }
      font = bodyFonts[bodyFont]
    }
  }
  
  @IBInspectable var subBodyFont: Int = 0 {
    didSet {
      guard subBodyFont != subBodyFonts.count else {
        return
      }
      font = subBodyFonts[subBodyFont]
    }
  }
  
  private let titleFonts: [UIFont] = [.title1, .title2, .title3, .title4, .title5,
                                      .title6, .title7]
  private let bodyFonts: [UIFont] = [.body1, .body2, .body3, .body4, .body5,
                                     .body6, .body7]
  private let subBodyFonts: [UIFont] = [.subBody1, .subBody2, .subBody3, .subBody4,
                                        .subBody5, .subBody6, .subBody7]
  
}
