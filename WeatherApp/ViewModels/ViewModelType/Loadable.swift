//
//  Loadable.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 27/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import RxSwift

protocol Loadable {
  var loading: Observable<Loading>! { get set }
  var loadingTrigger: AnyObserver<Loading>! { get set }
  var disposeBag: DisposeBag { get }
}

struct Loading {
  var isLoading: Bool
  var type: LoadingType
  
  init(_ isLoading: Bool, type: LoadingType = .fullScreen) {
    self.isLoading = isLoading
    self.type = type
  }
}

enum LoadingType {
  case fullScreen, button
}
