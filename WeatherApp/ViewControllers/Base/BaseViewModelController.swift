//
//  BaseViewModelController.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 29/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import RxSwift
import UIKit

///
/// Any `ViewController` need to have a view model it should inherit this
/// class. this class will provid an injected `viewModel`.
///
/// An example:
/// ```
/// class SplashViewController: BaseViewModelController<SplashViewModel> {
///   .....
///   private func observeForItems() {
///     viewModel.items
///       .subscribe(onNext: {
///   .....
/// }
/// ```
///
class BaseViewModelController<ViewModel: ViewModelType>: BaseViewController {
  
  // MARK: - Properties
  @Injected var viewModel: ViewModel
  
  var disposeBag = DisposeBag()
  
  // MARK: Private properties
  // MARK: - ViewController lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  private func observeForErrors() {
    guard let errorEmitable = viewModel as? ErrorEmitable else {
      return
    }
    errorEmitable.error
      .subscribe(onNext: { error in
        // TODO: Show error
      })
      .disposed(by: disposeBag)
  }
  
  private func observeForLoading() {
    guard let loadable = viewModel as? Loadable else {
      return
    }
    loadable.loading
      .subscribe(onNext: { isLoading in
        // TODO: Show loading
      })
      .disposed(by: disposeBag)
  }
}
