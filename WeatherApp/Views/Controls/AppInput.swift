//
//  AppInput.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 27/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import UIKit
import RxCocoa

@IBDesignable
class AppInput: UIView {
  
  // MARK: - Properties
  
  @IBInspectable var placeholder: String = "" {
    didSet {
      textField.placeholder = placeholder.localized
    }
  }
  
  var text: ControlProperty<String?> {
    textField.rx.text
  }
  
  // MARK: Private properties
  
  private var textField: UITextField!
  private var button: UIButton!
  
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
    textField = UITextField()
    textField.font = .subBody4
    textField.textColor = .secondary
    addSubview(textField)
    
    button = UIButton()
    button.setImage(UIImage(image: .target), for: .normal)
    button.tintColor = .secondary
    addSubview(button)
    
    makeConstraints()
  }
  
  private func makeConstraints() {
    
    textField.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      textField.topAnchor.constraint(equalTo: topAnchor, constant: 8),
      textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
      textField.heightAnchor.constraint(equalToConstant: 50),
    ])
    
    button.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      button.leadingAnchor.constraint(equalTo: textField.trailingAnchor,
                                      constant: 16),
      button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      button.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
      button.heightAnchor.constraint(equalToConstant: 30),
      button.widthAnchor.constraint(equalToConstant: 30),
    ])
  }
  
  // MARK: - View lifecycle

  override func layoutSublayers(of layer: CALayer) {
    super.layoutSublayers(of: layer)
    roundedCorner()
    addShadow()
  }
}
