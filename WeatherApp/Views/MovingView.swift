//
//  MovingView.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 27/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import UIKit

@IBDesignable
class MovingView: UIView {
  
  // MARK: - Properties
  
  var image: Images = .sun
  
  // MARK: Private properties
  
  private var imageLayer: CALayer!
  private let imageSize: CGFloat = 90
  
  // MARK: - init
  
  init(image: Images) {
    super.init(frame: .zero)
    self.image = image
    setup()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  private func setup() {
    
    backgroundColor = .clear
    
    imageLayer = CALayer()
    imageLayer.contents = UIImage(image: image).cgImage
    
    var xStartPoint: CGFloat = 0.0
    var yStartPoint: CGFloat = 0.0

    if image == .sun {
      xStartPoint = -imageSize
      yStartPoint = -imageSize
    } else {
      xStartPoint = -imageSize
      yStartPoint = CGFloat((Int(imageSize)...250).randomElement() ?? 0)
    }
    
    imageLayer.frame = CGRect(x: xStartPoint,
                              y: yStartPoint,
                              width: imageSize,
                              height: imageSize)
    layer.addSublayer(imageLayer)
  }
  
  // MARK: - Public
  
  func move(duration: Double,
            autoreverses: Bool = false,
            timingFunction: CAMediaTimingFunctionName = .easeOut){
    let animation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.position))
    animation.duration = duration
    animation.path = getPath()
    animation.timingFunction = CAMediaTimingFunction(name: timingFunction)
    animation.fillMode = .forwards
    animation.autoreverses = autoreverses
    animation.isRemovedOnCompletion = false
    imageLayer.add(animation, forKey: nil)
  }
  
  // MARK: - Private
  
  private func getPath() -> CGPath {
    switch image {
    case .sun:
      return getSunPath()
    case .cloud:
      return getCloudPath()
    default:
      fatalError()
    }
  }
  
  private func getSunPath() -> CGPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 0, y: 0))
    path.addQuadCurve(to: CGPoint(x: frame.width - imageSize,
                                  y: frame.height + imageSize),
                      controlPoint: CGPoint(x: frame.width,
                                            y: 0))
    return path.cgPath
  }
  
  private func getCloudPath() -> CGPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: -imageSize, y: imageLayer.frame.origin.y))
    path.addLine(to: CGPoint(x: frame.width + imageSize,
                             y: imageLayer.frame.origin.y))
    return path.cgPath
  }
  
}
