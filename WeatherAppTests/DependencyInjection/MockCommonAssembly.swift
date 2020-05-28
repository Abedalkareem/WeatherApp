//
//  MockCommonAssembly.swift
//  WeatherAppTests
//
//  Created by abedalkareem omreyh on 29/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import Swinject
import SwinjectAutoregistration
@testable import WeatherApp

class MockCommonAssembly: Assembly {
  func assemble(container: Container) {
    container.autoregister(FetcherType.self, initializer: Fetcher.init)
    container.autoregister(NetworkingType.self, initializer: MockHttpClient.init)
    container.autoregister(LocationProvider.self, initializer: MockLocationHelper.init)
  }
}
