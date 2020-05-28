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
  private var weatherDetailsCard: WeatherDetailsCard!
  
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
    weatherImageView.contentMode = .scaleAspectFit
    addSubview(weatherImageView)
    
    titleLabel = AppLabel()
    titleLabel.font = .appLogo
    titleLabel.text = item.name
    titleLabel.textColor = .primary
    titleLabel.textAlignment = .center
    addSubview(titleLabel)
    
    weatherDetailsCard = WeatherDetailsCard(item: item)
    addSubview(weatherDetailsCard)
    
    makeConstraints()
  }
  
  private func makeConstraints() {
    
    translatesAutoresizingMaskIntoConstraints = false
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
      titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])
    
    weatherImageView.translatesAutoresizingMaskIntoConstraints = false
    weatherImageView.setContentHuggingPriority(.defaultLow, for: .vertical)
    weatherImageView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    NSLayoutConstraint.activate([
      weatherImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                            constant: 20),
      weatherImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      weatherImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
      weatherImageView.bottomAnchor.constraint(equalTo: weatherDetailsCard.topAnchor,
                                               constant: -30)
    ])
    
    weatherDetailsCard.translatesAutoresizingMaskIntoConstraints = false
    weatherDetailsCard.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
    NSLayoutConstraint.activate([
      weatherDetailsCard.bottomAnchor.constraint(equalTo: bottomAnchor),
      weatherDetailsCard.trailingAnchor.constraint(equalTo: trailingAnchor),
      weatherDetailsCard.leadingAnchor.constraint(equalTo: leadingAnchor),
    ])
  }
  
}
