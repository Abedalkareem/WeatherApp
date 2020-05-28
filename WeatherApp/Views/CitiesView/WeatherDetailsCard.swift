//
//  WeatherDetailsCard.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 28/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import UIKit

class WeatherDetailsCard: UIView {
  
  // MARK: - Properties
  
  // MARK: Private properties
  
  private var item: CityWeatherViewModel!
  
  private var watherLabel: AppLabel!
  private var watherValueLabel: AppLabel!
  private var watherDescriptionLabel: AppLabel!
  private var watherDescriptionValueLabel: AppLabel!
  private var windLabel: AppLabel!
  private var windValueLabel: AppLabel!
  
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
    
    backgroundColor = .primary

    watherLabel = AppLabel()
    watherLabel.font = .body4
    watherLabel.text = "min_max".localized
    watherLabel.textColor = .secondary
    watherLabel.textAlignment = .left
    addSubview(watherLabel)
    
    watherValueLabel = AppLabel()
    watherValueLabel.font = .body4
    watherValueLabel.text = item.minMaxWeather
    watherValueLabel.textColor = .secondary
    watherValueLabel.textAlignment = .right
    addSubview(watherValueLabel)
    
    watherDescriptionLabel = AppLabel()
    watherDescriptionLabel.font = .body4
    watherDescriptionLabel.text = "description".localized
    watherDescriptionLabel.textColor = .secondary
    watherDescriptionLabel.textAlignment = .left
    addSubview(watherDescriptionLabel)
    
    watherDescriptionValueLabel = AppLabel()
    watherDescriptionValueLabel.font = .body4
    watherDescriptionValueLabel.text = item.description
    watherDescriptionValueLabel.textColor = .secondary
    watherDescriptionValueLabel.textAlignment = .right
    addSubview(watherDescriptionValueLabel)
    
    
    windLabel = AppLabel()
    windLabel.font = .body4
    windLabel.text = "wind_speed".localized
    windLabel.textColor = .secondary
    windLabel.textAlignment = .left
    addSubview(windLabel)
    
    windValueLabel = AppLabel()
    windValueLabel.font = .body4
    windValueLabel.text = item.windSpeed
    windValueLabel.textColor = .secondary
    windValueLabel.textAlignment = .right
    addSubview(windValueLabel)
    
    makeConstraints()
  }
  
  private func makeConstraints() {
    watherLabel.translatesAutoresizingMaskIntoConstraints = false
    watherLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    watherLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    NSLayoutConstraint.activate([
      watherLabel.topAnchor.constraint(equalTo: topAnchor,
                                       constant: 20),
      watherLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                           constant: 10),
    ])
    
    watherValueLabel.translatesAutoresizingMaskIntoConstraints = false
    watherValueLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
    NSLayoutConstraint.activate([
      watherValueLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
      watherValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                 constant: -10),
      watherValueLabel.leadingAnchor.constraint(equalTo: watherLabel.trailingAnchor)
    ])
    
    watherDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    watherDescriptionLabel.setContentCompressionResistancePriority(.defaultHigh,
                                                                   for: .horizontal)
    watherDescriptionLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    NSLayoutConstraint.activate([
      watherDescriptionLabel.topAnchor.constraint(equalTo: watherLabel.bottomAnchor,
                                                  constant: 20),
      watherDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                      constant: 10),
    ])
    
    watherDescriptionValueLabel.translatesAutoresizingMaskIntoConstraints = false
    watherDescriptionValueLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
    NSLayoutConstraint.activate([
      watherDescriptionValueLabel.topAnchor.constraint(equalTo: watherLabel.bottomAnchor,
                                                       constant: 20),
      watherDescriptionValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                            constant: -10),
      watherDescriptionValueLabel.leadingAnchor.constraint(equalTo: watherDescriptionLabel.trailingAnchor)
    ])
    
    windLabel.translatesAutoresizingMaskIntoConstraints = false
    windLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    windLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    NSLayoutConstraint.activate([
      windLabel.topAnchor.constraint(equalTo: watherDescriptionLabel.bottomAnchor,
                                     constant: 20),
      windLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                         constant: 10),
      windLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
    ])
    
    windValueLabel.translatesAutoresizingMaskIntoConstraints = false
    windValueLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
    NSLayoutConstraint.activate([
      windValueLabel.topAnchor.constraint(equalTo: watherDescriptionLabel.bottomAnchor,
                                          constant: 20),
      windValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                               constant: -10),
      windValueLabel.leadingAnchor.constraint(equalTo: windLabel.trailingAnchor)
    ])
  }
  
  // MARK: - View lifecycle

  override func layoutSublayers(of layer: CALayer) {
    super.layoutSublayers(of: layer)
    roundedCorner()
    addShadow()
  }
  
}
