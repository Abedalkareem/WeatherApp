//
//  WeatherServices.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 27/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import RxSwift

class WeatherServices: ServicesType {
  
  private var fetcher: FetcherType

  init(fetcher: FetcherType) {
    self.fetcher = fetcher
  }

  func weatherForCity(_ city: String) -> Observable<CityWeather> {
    return fetcher.fetch(endpoint: WeatherEndPoints.weatherForCity(city))
  }
  
  func forecastForCity(_ city: String) -> Observable<CityWeather> {
    return fetcher.fetch(endpoint: WeatherEndPoints.forecastForCity(city))
  }
  
}
