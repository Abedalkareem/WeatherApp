//
//  MainViewModelTests.swift
//  WeatherAppTests
//
//  Created by abedalkareem omreyh on 29/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

@testable import WeatherApp
import XCTest
import RxSwift

class MainViewModelTests: XCTestCase {
  
  @Injected var viewModel: MainViewModel

  var disposeBag: DisposeBag!

  override func setUpWithError() throws {
    disposeBag = DisposeBag()
  }
  
  func testSearchingForCities() throws {
        
    let expectation = self.expectation(description: "wait searching for 3 cities")
    var cities: [CityWeatherViewModel]?
    
    viewModel.status.subscribe(onNext: {
      cities = $0
      expectation.fulfill()
    })
      .disposed(by: disposeBag)
    
    viewModel.searchText.on(.next("Amman, Dubai, Tokyo"))
    
    waitForExpectations(timeout: 5)
    
    XCTAssertEqual(cities?.count, 3)
  }
  
  func testSearchingForLessThan7Cities() {
    
    let expectation = self.expectation(description: "wait searching for 2 cities")

    var cities: [CityWeatherViewModel]?
    
    viewModel.status.subscribe(onNext: {
      cities = $0
    })
      .disposed(by: disposeBag)
    
    viewModel.searchText.on(.next("Amman, Tokyo"))
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      expectation.fulfill()
    }
    
    waitForExpectations(timeout: 5)
    
    XCTAssertEqual(cities?.count ?? 0, 0)
  }
  
  func testSearchingForLessThan3Cities() {
    
    let expectation = self.expectation(description: "wait searching for 8 cities")
        
    var cities: [CityWeatherViewModel]?
    
    viewModel.status.subscribe(onNext: {
      cities = $0
    })
      .disposed(by: disposeBag)
    
    viewModel.searchText.on(.next("Amman, Tokyo, Amman, Tokyo, Amman, Tokyo, Amman, Tokyo"))

    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      expectation.fulfill()
    }
    
    waitForExpectations(timeout: 5)
    
    XCTAssertEqual(cities?.count ?? 0, 0)
  }
  
}
