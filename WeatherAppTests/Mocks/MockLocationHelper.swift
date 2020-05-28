//
//  MockLocationHelper.swift
//  WeatherAppTests
//
//  Created by abedalkareem omreyh on 29/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

@testable import WeatherApp
import RxSwift
import CoreLocation
import RxTest

class MockLocationHelper: LocationProvider {
  var currentUserLocation: Observable<CLLocation?> {
    BehaviorSubject(value: CLLocation(latitude: 25.276987, longitude: 55.296249))
  }
  
  func requestAuthorization() { }
  
  func startUpdating() { }
  
  func getAddressFrom(location: CLLocation) -> Observable<Address> {
    BehaviorSubject(value: Address(subLocality: nil,
                                   thoroughfare: nil,
                                   locality: "Dubai",
                                   country: "UAE",
                                   postalCode: nil))
  }
  
  
}


