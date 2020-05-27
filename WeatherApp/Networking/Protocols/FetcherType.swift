//
//  FetcherType.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 26/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import Foundation
import RxSwift

protocol FetcherType {
  
  func fetch<T: Decodable>(endpoint: EndPoint) -> Observable<T>
  func fetch(endpoint: EndPoint) -> Observable<Void>
  func fetchArray<T: Decodable>(endpoint: EndPoint) -> Observable<[T]>
}
