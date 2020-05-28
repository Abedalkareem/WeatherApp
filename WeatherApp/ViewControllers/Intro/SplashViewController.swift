//
//  SplashViewController.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 26/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
  
  // MARK: - IBOutlets
  
  @IBOutlet private weak var timeLapseView: TimeView!
  
  // MARK: View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    animate()
  }
  
  private func animate() {
    timeLapseView.animate() {
      self.showNextViewController()
    }
  }
  
  private func showNextViewController() {
    let viewController = MainViewController.instance()
    setRootViewController(viewController: viewController,
                          animated: true)
  }
  
}

