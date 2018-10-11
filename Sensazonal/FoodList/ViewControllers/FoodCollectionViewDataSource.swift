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
        } catch {
            Logger.shared.outOfBounds(at: section)
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodViewCell.identifier, for: indexPath)
        guard let foodCell = cell as? FoodViewCell else { return cell }

        do {
            let viewModel = try dataProvider.food(at: indexPath)
            foodCell.bind(viewModel: viewModel)
            foodCell.addFavoriteAction { [weak self] in
                self?.dataProvider.favoritateFood(foodKey: viewModel.foodKey)
            }
            return cell
        } catch {
            Logger.shared.outOfBounds(at: indexPath)
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: FoodGroupView.identifier,
            for: indexPath) as? FoodGroupView else { return UICollectionReusableView() }

        do {
            let group = try dataProvider.group(at: indexPath.section)
            header.bind(group: group)
            return header
        } catch {
            Logger.shared.outOfBounds(at: indexPath)
            return header
        }
    }

}
