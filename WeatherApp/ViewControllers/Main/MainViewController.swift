//
//  MainViewController.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 27/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  // MARK: - IBOutlets
  
  @IBOutlet private weak var timeView: TimeView!
  
  
  // MARK: View controller lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    
    timeView.setCurrentTime()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
  }
  
}
