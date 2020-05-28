//
//  UICollectionView+Helpers.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 28/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

extension UICollectionView {
  /// register the cell to the table view by passing the metatype
  func register<T: UICollectionViewCell>(_: T.Type) {
    let bundle = Bundle(for: T.self)
    let nib = UINib(nibName: T.nibName, bundle: bundle)
    register(nib, forCellWithReuseIdentifier: T.nibName)
  }

  /// register the cell to the table view by passing the metatype
  func registerWithoutNib<T: UICollectionViewCell>(_: T.Type) {
    register(T.self, forCellWithReuseIdentifier: T.nibName)
  }

  /// dequeue reusable cell by the returning type, the identifier will be the nib name
  func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withReuseIdentifier: T.nibName, for: indexPath) as? T else {
      fatalError("Could not dequeue cell with identifier: \(T.nibName)")
    }
    return cell
  }
}

extension UICollectionViewCell: NibLoadableView {
  static var nibName: String {
    return String(describing: self)
  }
}

extension Reactive where Base: UICollectionView {
  func items<Sequence: Swift.Sequence, Cell: UICollectionViewCell, Source: ObservableType>
      (cellType: Cell.Type = Cell.self)
      -> (_ source: Source)
      -> (_ configureCell: @escaping (Int, Sequence.Element, Cell) -> Void)
      -> Disposable where Source.Element == Sequence {
      return items(cellIdentifier: cellType.nibName, cellType: cellType)
  }
}
