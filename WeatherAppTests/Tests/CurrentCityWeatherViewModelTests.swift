//
//  CurrentCityWeatherViewModelTests.swift
//  WeatherAppTests
//
//  Created by abedalkareem omreyh on 29/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

@testable import WeatherApp
import XCTest
import RxSwift

class CurrentCityWeatherViewModelTests: XCTestCase {
  
  var disposeBag: DisposeBag!
  @Injected var viewModel: CurrentCityWeatherViewModel
  
  override func setUpWithError() throws {
    disposeBag = DisposeBag()
  }
  
  func testWeatherShouldBeFor5Days() throws {
    
    let expectation = self.expectation(description: "wait current city")
    var weather: [String: [CityWeatherViewModel]]?
    
    viewModel.status.subscribe(onNext: {
      weather = $0
      expectation.fulfill()
    })
      .disposed(by: disposeBag)
    
    waitForExpectations(timeout: 5)
    
    XCTAssertEqual(weather?.count ?? 0, 5)
  }
  
}
