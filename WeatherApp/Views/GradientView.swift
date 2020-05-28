//
//  GradientView.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 27/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
  
  // MARK: - Properties
  
  var backgroundType: Time = .morning {
    didSet {
      changeGradient()
    }
  }
  
  // MARK: Private properties
  
  private var gradientLayer: CAGradientLayer!
  private var colors: [CGColor] {
    var colors: [UIColor] = []
    switch backgroundType {
    case .morning:
      colors = UIColor.morningColors
    case .night:
      colors = UIColor.nightColors
    case .afternoon:
      colors = UIColor.afternoonColors
    }
    return colors.map({ $0.cgColor })
  }
  
  // MARK: - init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  private func setup() {
    gradientLayer = CAGradientLayer()
    gradientLayer.locations = [0.0 , 1.0]
    gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
    gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
    gradientLayer.colors = colors
    changeGradient()
    layer.addSublayer(gradientLayer)
  }
  
  // MARK: - View lifecycle
  
  override func layoutSublayers(of layer: CALayer) {
    updateGradientFrame()
  }
  
  private func updateGradientFrame() {
    gradientLayer.frame = layer.bounds
  }
  
  private func changeGradient() {
    let colorsAnimation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.colors))
    colorsAnimation.fromValue = gradientLayer.colors
    colorsAnimation.toValue = colors
    colorsAnimation.duration = 2.0
    colorsAnimation.fillMode = .forwards
    colorsAnimation.isRemovedOnCompletion = false
    colorsAnimation.delegate = self
    gradientLayer.add(colorsAnimation, forKey: "colors")
    updateGradientFrame()
  }
  
}

// MARK: - CAAnimationDelegate

extension GradientView: CAAnimationDelegate {
  func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
    if flag {
      gradientLayer.colors = colors
    }
  }
}
