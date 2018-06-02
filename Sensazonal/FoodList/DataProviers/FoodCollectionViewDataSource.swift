import UIKit

final class FoodCollectionViewDataSource: NSObject, UICollectionViewDataSource {

    private let dataProvider: FoodListDataProvider

    init(dataProvider: FoodListDataProvider) {
        self.dataProvider = dataProvider
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataProvider.groupsQuantity()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        do {
            return try dataProvider.foodsQuantity(at: section)
        } catch { return 0 }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodViewCell.identifier, for: indexPath)
        guard let foodCell = cell as? FoodViewCell else { return cell }

        do {
            let viewModel = try dataProvider.food(at: indexPath)
            foodCell.bind(viewModel: viewModel)
            return cell
        } catch { return cell }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionElementKindSectionHeader,
            withReuseIdentifier: FoodGroupView.identifier,
            for: indexPath) as? FoodGroupView else { return UICollectionReusableView() }

        do {
            let group = try dataProvider.group(at: indexPath.section)
            header.bind(group: group)
            return header
        } catch { return header }
    }

}
