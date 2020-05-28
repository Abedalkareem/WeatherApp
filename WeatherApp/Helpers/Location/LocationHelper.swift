//
//  LocationHelper.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 28/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import CoreLocation
import RxCoreLocation
import RxSwift

class LocationHelper: LocationProvider {
  
  private let manager: CLLocationManager
  private let disposeBag: DisposeBag
  private let geocoder: CLGeocoder
  
  var currentUserLocation: Observable<CLLocation?> {
    manager.rx.location
  }
  
  init() {
    manager = CLLocationManager()
    geocoder = CLGeocoder()
    disposeBag = DisposeBag()
  }
  
  func requestAuthorization() {
    manager.requestAlwaysAuthorization()
    manager.rx
      .didChangeAuthorization
      .subscribe(onNext: { [weak self] _, status in
        switch status {
        case .denied:
          print("Authorization denied")
        case .notDetermined:
          print("Authorization: not determined")
        case .restricted:
          print("Authorization: restricted")
        case .authorizedAlways, .authorizedWhenInUse:
          self?.startUpdating()
        @unknown default:
          break
        }
      })
      .disposed(by: disposeBag)
    
  }
  
  func startUpdating() {
    manager.startUpdatingLocation()
  }
  
  func getAddressFrom(location: CLLocation) -> Observable<Address> {
    return Observable.create { [weak self] observer -> Disposable in
      self?.geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
        guard error == nil else {
          observer.on(.error(error!))
          return
        }
        let address = (placemarks! as [CLPlacemark]).first

        observer.on(.next(Address(subLocality: address?.subLocality,
                                  thoroughfare: address?.thoroughfare,
                                  locality: address?.locality,
                                  country: address?.country,
                                  postalCode: address?.postalCode)))
      }
      return Disposables.create()
    }
  }
}
