//
//  ViewModelType.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 27/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import RxSwift

protocol ViewModelType {
  associatedtype Item
  var status: Observable<Item> { get set }
  var disposeBag: DisposeBag { get }
}
