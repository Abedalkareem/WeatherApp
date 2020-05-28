//
//  Assembler.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 29/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import Swinject

extension Assembler {
  static let shared: Assembler = {
    let container = Container()
    let assemblies: [Assembly] = [CommonAssembly(), ServicesAssembly()] + viewModelsAssemblies
    let assembler = Assembler(assemblies, container: container)
    return assembler
  }()
}
