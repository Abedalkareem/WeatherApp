//
//  MainViewModelsAssembly.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 29/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

class MainViewModelsAssembly: Assembly {
  func assemble(container: Container) {
    container.autoregister(MainViewModel.self, initializer: MainViewModel.init)
    container.autoregister(CurrentCityWeatherViewModel.self,
                           initializer: CurrentCityWeatherViewModel.init)
  }
}
