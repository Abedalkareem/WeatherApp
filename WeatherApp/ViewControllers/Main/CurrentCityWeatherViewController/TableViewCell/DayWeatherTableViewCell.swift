//
//  DayWeatherTableViewCell.swift
//  WeatherApp
//
//  Created by abedalkareem omreyh on 28/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import UIKit
import RxSwift

class DayWeatherTableViewCell: UITableViewCell {
  
  // MARK: - IBOutlets
  
  @IBOutlet private weak var dayLabel: AppLabel!
  @IBOutlet private weak var containerView: UIView!
  @IBOutlet private weak var collectionView: UICollectionView!
  
  // MARK: - Private properties
  
  private let items = PublishSubject<[CityWeatherViewModel]>()
  private let disposeBag = DisposeBag()
  
  // MARK: - View lifecycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    selectionStyle = .none
    
    registerCell()
    setupCollectionFlowLayout()
    bindItems()
    setDelegate()
  }
  
  override func layoutSublayers(of layer: CALayer) {
    super.layerWillDraw(layer)
    containerView.addShadow()
  }
  
  private func registerCell() {
    collectionView.register(HourWeatherCollectionViewCell.self)
  }
  
  private func setupCollectionFlowLayout() {
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    layout.minimumInteritemSpacing = 0
    layout.minimumLineSpacing = 0
    collectionView!.collectionViewLayout = layout
  }
  
  private func bindItems() {
    items
      .bind(to: collectionView.rx
        .items(cellType: HourWeatherCollectionViewCell.self)) { _, model, cell in
          cell.setupWith(model)
    }
    .disposed(by: disposeBag)
  }
  
  private func setDelegate() {
    collectionView.rx
      .setDelegate(self)
      .disposed(by: disposeBag)
  }
  
  // MARK: - Setup
  
  func setupWith(item: (day: String, items: [CityWeatherViewModel])) {
    self.items.on(.next(item.items))
    dayLabel.text = item.day
  }
  
}

// MARK: - UICollectionViewDelegateFlowLayout

extension DayWeatherTableViewCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: frame.width / 4, height: collectionView.frame.height / 3)
  }
}
