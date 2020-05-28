//
//  TimeView.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 27/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

@IBDesignable
class TimeView: UIView {
  
  // MARK: - Properties
  
  var backgroundType: Time = .morning {
    didSet {
      gradientView.backgroundType = backgroundType
    }
  }
  
  // MARK: Private properties
  
  private var gradientView: GradientView!
  private var movingSunView: MovingView!
  private var movingCloudView: MovingView!
  private var secondMovingCloudView: MovingView!
  private var animationDuration: Double = 7
  
  private let appTime = AppTime()
  
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
    gradientView = GradientView()
    addSubview(gradientView)
    
    movingSunView = MovingView(image: .sun)
    addSubview(movingSunView)
    
    movingCloudView = MovingView(image: .cloud)
    movingCloudView.alpha = 0.5
    addSubview(movingCloudView)
    
    secondMovingCloudView = MovingView(image: .cloud)
    secondMovingCloudView.alpha = 0.5
    addSubview(secondMovingCloudView)
  }
  
  // MARK: - View lifecycle
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    gradientView.frame = bounds
    movingSunView.frame = bounds
    movingCloudView.frame = bounds
    secondMovingCloudView.frame = bounds
  }
  
  // MARK: - Private

  fileprivate func setCurrentTime(with timeZone: Int?) {
    gradientView.backgroundType = appTime.getCurrentTime(with: timeZone)
  }
  
  // MARK: - Public
  
  func animate(completion: (() -> Void)? = nil) {
    self.movingSunView.move(duration: animationDuration * 0.7)
    self.movingCloudView.move(duration: animationDuration,
                              timingFunction: .linear)
    self.secondMovingCloudView.move(duration: animationDuration * 0.6,
                                    timingFunction: .linear)
    
    self.gradientView.backgroundType = .afternoon
    DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration * 0.4) {
      self.gradientView.backgroundType = .night
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
      completion?()
    }
  }
  
}

extension Reactive where Base: TimeView {
  var currentTime: Binder<Int> {
    return Binder(self.base) { view, timeZone in
      view.setCurrentTime(with: timeZone)
    }
  }
}
