//
//  CommonAssembly.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 29/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

class CommonAssembly: Assembly {
  func assemble(container: Container) {
    container.autoregister(FetcherType.self, initializer: Fetcher.init)
    container.autoregister(NetworkingType.self, initializer: HttpClient.init)
    container.autoregister(LocationProvider.self, initializer: LocationHelper.init)
  }
}
