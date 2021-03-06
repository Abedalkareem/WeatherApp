//
//  UIView+Animation.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 26/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import UIKit

extension UIView {

  func animate(_ animations: [AppAnimation]) {
      // Exit condition: once all animations have been performed, we can return
      guard !animations.isEmpty else {
          return
      }

      // Remove the first animation from the queue
      var animations = animations
      let animation = animations.removeFirst()

      // Perform the animation by calling its closure
      UIView.animate(withDuration: animation.duration,
                     animations: {
          animation.closure(self)
      }, completion: { _ in
          // Recursively call the method, to perform each animation in sequence
          self.animate(animations)
      })
  }

  func animate(inParallel animations: [AppAnimation]) {
      for animation in animations {
          UIView.animate(withDuration: animation.duration) {
              animation.closure(self)
          }
      }
  }

}
