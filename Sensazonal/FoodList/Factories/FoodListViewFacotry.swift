import UIKit

struct FoodListViewFacotry {

    static func make(dataSource: UICollectionViewDataSource) -> UIView & Reloadable {
        let view = FoodListCollectionView()
        view.setupDataSource(dataSource)
        return view
    }

}
