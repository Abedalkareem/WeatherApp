//
//  HttpClient.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 26/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import Foundation

class HttpClient: NSObject, NetworkingType {

  private var urlSession: URLSession?

  override init() {
    super.init()
    let configuration = URLSessionConfiguration.default
    urlSession = URLSession(configuration: configuration)
  }

  ///
  /// Make a request and return a result or failure.
  /// - Parameter request: A url request to execute.
  /// - Parameter completion: A cluser will get call after the request finish.
  /// It will return `Error` in case of failure, and `Data` in case of success.
  ///
  func request(_ request: URLRequest?, completion: @escaping (Error?, Data?) -> Void) {
    urlSession?.dataTask(with: request!, completionHandler: { (data, response, error) in
      guard error == nil else {
        DispatchQueue.main.async {
          completion(error, nil)
        }
        return
      }
      DispatchQueue.main.async {
        completion(nil, data)
      }
    })
    .resume()
  }
}
