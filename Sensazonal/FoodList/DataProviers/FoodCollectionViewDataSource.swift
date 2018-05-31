import UIKit

final class FoodCollectionViewDataSource: NSObject, UICollectionViewDataSource {

    private let dataProvider: FoodListDataProvider

    init(dataProvider: FoodListDataProvider) {
        self.dataProvider = dataProvider
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataProvider.groupsTotal()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataProvider.foodsTotal(for: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodViewCell.identifier, for: indexPath)
        guard let foodCell = cell as? FoodViewCell else { return cell }

        foodCell.bind(viewModel: dataProvider.food(at: indexPath))

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath)
        -> UICollectionReusableView {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader,
                                                                         withReuseIdentifier: FoodGroupView.identifier,
                                                                         for: indexPath) as? FoodGroupView else {
                                                                            return UICollectionReusableView()
            }

            header.bind(groupTitle: dataProvider.groupName(at: indexPath.section))

            return header
    }

}

class FoodGroupView: UICollectionReusableView {
    static let identifier = String(describing: FoodGroupView.self)

    private let group: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: Metric.large)
        return label
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        installSubviews()
        installConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bind(groupTitle: String) {
        group.text = groupTitle
    }

    private func installSubviews() {
        addSubview(group)
    }

    private func installConstraints() {
        NSLayoutConstraint.activate([
            group.leadingAnchor.constraint(equalTo: leadingAnchor),
            group.topAnchor.constraint(equalTo: topAnchor),
            group.trailingAnchor.constraint(equalTo: trailingAnchor),
            group.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
