//
//  NetworkingType.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 26/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import Foundation

protocol NetworkingType {
  func request(_ request: URLRequest?, completion: @escaping (Error?, Data?) -> Void)
}
