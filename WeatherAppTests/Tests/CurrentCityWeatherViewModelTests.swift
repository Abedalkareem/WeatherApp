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
import RxBlocking

class CurrentCityWeatherViewModelTests: XCTestCase {
  
  var disposeBag: DisposeBag!
  @Injected var viewModel: CurrentCityWeatherViewModel
  
  override func setUpWithError() throws {
    disposeBag = DisposeBag()
  }
  
  func testWeatherShouldBeFor5Days() throws {
    let weather = try? viewModel.status.toBlocking().first()
    XCTAssertEqual(weather?.count ?? 0, 5)
  }
  
}
