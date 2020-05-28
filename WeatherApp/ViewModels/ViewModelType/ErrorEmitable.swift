//
//  ErrorEmitable.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 27/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import RxSwift

protocol ErrorEmitable {
  var error: Observable<Error>! { get set }
  var errorTrigger: AnyObserver<Error>! { get set }
  var disposeBag: DisposeBag { get }
}
