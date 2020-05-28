//
//  Injected.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 29/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import Foundation
import Swinject

@propertyWrapper
struct Injected<Value> {

  init() {
    self.wrappedValue = Assembler.shared.resolver.resolve(Value.self)!
  }

  var wrappedValue: Value
}
