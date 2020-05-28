//
//  LocationProvider.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 28/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import CoreLocation
import RxSwift

protocol LocationProvider {

  var currentUserLocation: Observable<CLLocation?> { get }

  func requestAuthorization()
  func startUpdating()
  func getAddressFrom(location: CLLocation) -> Observable<Address>
}
