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
  
  @IBOutlet private weak var dayLabel: AppLabel!
  @IBOutlet private weak var containerView: UIView!
  @IBOutlet private weak var collectionView: UICollectionView!
  
  let items = PublishSubject<[CityWeatherViewModel]>()
  let disposeBag = DisposeBag()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    selectionStyle = .none
    
    collectionView.register(HourWeatherCollectionViewCell.self)
    
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    layout.minimumInteritemSpacing = 0
    layout.minimumLineSpacing = 0
    collectionView!.collectionViewLayout = layout

    bindItems()
    setDelegate()
  }
  
  private func bindItems() {
    items
      .bind(to: collectionView.rx.items(cellType: HourWeatherCollectionViewCell.self)) { _, model, cell in
        cell.setupWith(model)
    }
    .disposed(by: disposeBag)
  }
  
  private func setDelegate() {
    collectionView.rx
      .setDelegate(self)
      .disposed(by: disposeBag)
  }
  
  override func layoutSublayers(of layer: CALayer) {
    super.layerWillDraw(layer)
    containerView.addShadow()
  }
  
  func setupWith(item: (day: String, items: [CityWeatherViewModel])) {
    self.items.on(.next(item.items))
    dayLabel.text = item.day
  }
  
}

extension DayWeatherTableViewCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: frame.width / 4, height: collectionView.frame.height / 3)
  }
}
