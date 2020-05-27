//
//  CitiesView.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 27/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import UIKit

@IBDesignable
class CitiesView: UIView {
  
  // MARK: - Properties
  
  // MARK: Private properties
  
  private var scrollView: UIScrollView!
  
  private var items = [CityWeatherViewModel]()
  
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
    
    backgroundColor = .clear
    
    scrollView = UIScrollView()
    scrollView.isPagingEnabled = true
    scrollView.clipsToBounds = false
    scrollView.showsHorizontalScrollIndicator = false
    addSubview(scrollView)
    
    makeConstraints()
    
  }
  
  private func makeConstraints() {
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: topAnchor),
      scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
      scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
      scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
    ])
  }
  
  private func add(items: [CityWeatherViewModel]) {
    self.items = items
    scrollView.subviews.forEach({ $0.removeFromSuperview() })
    
    items
      .map(CityView.init(item:))
      .forEach(scrollView.addSubview)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    layoutScrollView()
  }
  
  private func layoutScrollView() {
    guard !items.isEmpty else {
      return
    }
    let numberOfPages: Int = items.count - 1
    let padding: CGFloat = 10
    let viewWidth = scrollView.bounds.size.width - 2 * padding
    let viewHeight = scrollView.bounds.size.height - 2 * padding
    
    var x: CGFloat = 0
    
    for i in 0...numberOfPages{
      let view = scrollView.subviews[i]
      view.frame =  CGRect(x: x + padding,
                           y: padding,
                           width: viewWidth,
                           height: viewHeight)
      x = view.frame.origin.x + viewWidth + padding
    }
    
    scrollView.contentSize = CGSize(width: x, height: scrollView.bounds.size.height)
  }
}
