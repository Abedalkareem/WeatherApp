//
//  MockAssembler.swift
//  WeatherAppTests
//
//  Created by abedalkareem omreyh on 29/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import Swinject
@testable import WeatherApp

extension Assembler {
  static let mockShared: Assembler = {
    let container = Container()
    let assemblies: [Assembly] = [MockCommonAssembly(), ServicesAssembly()] + viewModelsAssemblies
    let assembler = Assembler(assemblies, container: container)
    return assembler
  }()
}
