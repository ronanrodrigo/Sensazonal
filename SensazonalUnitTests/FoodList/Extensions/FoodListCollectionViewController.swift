import UIKit
@testable import Sensazonal

extension FoodListCollectionViewController {
    var collectionView: UICollectionView? {
        let list = self.view.subviews.first { $0.isKind(of: FoodListCollectionView.self) }
        return list?.subviews.first { $0.isKind(of: UICollectionView.self) } as? UICollectionView
    }

    var dataSource: UICollectionViewDataSource? {
        return collectionView?.dataSource
    }

    func numberOfItemsImSection(_ section: Int) -> Int {
        return dataSource!.collectionView(collectionView!, numberOfItemsInSection: 0)
    }
}
