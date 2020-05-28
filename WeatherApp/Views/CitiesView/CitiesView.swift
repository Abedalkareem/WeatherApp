//
//  CitiesView.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 27/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

@IBDesignable
class CitiesView: UIView {
  
  // MARK: - Properties
  
  var currentPage: Observable<Int?> {
    scrollView.rx.didEndDecelerating
      .map({ [weak self] in self?.scrollView.currentPage })
  }
  
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
  
  // MARK: - View lifecycle
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    layoutScrollView()
  }
  
  private func layoutScrollView() {
    guard !items.isEmpty else {
      return
    }
    let numberOfPages: Int = items.count - 1
    
    for index in 0...numberOfPages{
      let view = scrollView.subviews[index]
      makeConstraintFor(view: view, with: index, and: numberOfPages)
    }
  }
  
  private func makeConstraintFor(view: UIView, with index: Int, and numberOfPages: Int) {
    let padding: CGFloat = 10
    let viewWidth = scrollView.bounds.size.width - 2 * padding
    let viewHeight = scrollView.bounds.size.height - 2 * padding
    let subviews = scrollView.subviews

    var leading: NSLayoutConstraint!
    if index == 0 {
      leading = view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,
                                              constant: padding)
    } else if index == numberOfPages {
      leading = view.leadingAnchor.constraint(equalTo: subviews[index - 1].trailingAnchor,
                                              constant: padding)
    } else {
      leading = view.leadingAnchor.constraint(equalTo: subviews[index - 1].trailingAnchor,
                                              constant: padding)
    }
    
    if numberOfPages == 1 || index == numberOfPages {
      view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,
                                     constant: -padding).isActive = true
    }
    
    NSLayoutConstraint.activate([
      view.widthAnchor.constraint(equalToConstant: viewWidth),
      view.heightAnchor.constraint(equalToConstant: viewHeight),
      view.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: padding),
      view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: padding),
      leading,
    ])
  }
  
  // MARK: - Public
  
  func add(items: [CityWeatherViewModel]) {
    self.items = items
    scrollView.subviews.forEach({ $0.removeFromSuperview() })
    
    items
      .map(CityView.init(item:))
      .forEach(scrollView.addSubview)
    
    setNeedsLayout()
  }
}
