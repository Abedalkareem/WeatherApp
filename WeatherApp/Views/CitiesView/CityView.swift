//
//  CityView.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 27/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import UIKit

class CityView: UIView {
  
  // MARK: - Properties
  
  // MARK: Private properties
  
  private var item: CityWeatherViewModel!
  
  private var titleLabel: AppLabel!
  private var weatherImageView: UIImageView!
  private var watherLabel: AppLabel!
  private var watherDescriptionLabel: AppLabel!
  private var windLabel: AppLabel!

  // MARK: - init
  
  init(item: CityWeatherViewModel) {
    super.init(frame: .zero)
    self.item = item
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  private func setup() {
    
    weatherImageView = UIImageView()
    weatherImageView.image = item.image
    addSubview(weatherImageView)
    
    titleLabel = AppLabel()
    titleLabel.font = .title1
    titleLabel.text = item.name
    titleLabel.textColor = .primary
    addSubview(titleLabel)
    
    watherLabel = AppLabel()
    watherLabel.font = .body3
    watherLabel.text = item.wather
    watherLabel.textColor = .primary
    addSubview(watherLabel)
    
    watherDescriptionLabel = AppLabel()
    watherDescriptionLabel.font = .body2
    watherDescriptionLabel.text = item.description
    watherDescriptionLabel.textColor = .primary
    addSubview(watherDescriptionLabel)


    windLabel = AppLabel()
    windLabel.font = .body2
    windLabel.text = item.windSpeed
    windLabel.textColor = .primary
    addSubview(windLabel)
  }
  
  override func layoutSublayers(of layer: CALayer) {
    super.layoutSublayers(of: layer)
    addShadow()
  }
}
