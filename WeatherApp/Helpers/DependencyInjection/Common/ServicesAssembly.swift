//
//  ServicesAssembly.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 29/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

class ServicesAssembly: Assembly {
  func assemble(container: Container) {
    container.autoregister(WeatherServices.self, initializer: WeatherServices.init)
  }
}
