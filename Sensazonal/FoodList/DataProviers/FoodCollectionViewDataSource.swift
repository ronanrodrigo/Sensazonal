import UIKit

final class FoodCollectionViewDataSource: NSObject, UICollectionViewDataSource {

    private let dataProvider: FoodListDataProvider

    init(dataProvider: FoodListDataProvider) {
        self.dataProvider = dataProvider
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataProvider.foodsTotal()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodViewCell.identifier, for: indexPath)
        guard let foodCell = cell as? FoodViewCell else { return cell }

        foodCell.bind(viewModel: dataProvider.food(at: indexPath.row))

        return cell
    }

}
