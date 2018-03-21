import UIKit

final class FoodListCollectionView: UIView {

    private static let margin = Metric.extraLarge
    private static let columns: CGFloat = 2
    private static let edges = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    private let layout = UICollectionViewFlowLayout()
    private lazy var collection: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = FoodListCollectionView.edges
        collectionView.register(FoodViewCell.self, forCellWithReuseIdentifier: FoodViewCell.identifier)
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        installSubviews()
        installConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        installSuperViewConstraints()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layout.itemSize = FoodListCollectionView.generateItemSize(width: frame.width)
        layout.minimumLineSpacing = FoodListCollectionView.margin
        layout.minimumInteritemSpacing = FoodListCollectionView.margin
    }

    private func installSubviews() {
        addSubview(collection)
    }

    private func installConstraints() {
        let collectionConstraints = [
            collection.leadingAnchor.constraint(equalTo: leadingAnchor),
            collection.topAnchor.constraint(equalTo: topAnchor),
            collection.trailingAnchor.constraint(equalTo: trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: bottomAnchor)]
        NSLayoutConstraint.activate(collectionConstraints)
    }

    private func installSuperViewConstraints() {
        guard let parentView = superview else { return }
        let selfConstraints = [
            leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
            topAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.topAnchor),
            trailingAnchor.constraint(equalTo: parentView.trailingAnchor),
            bottomAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.bottomAnchor)]
        NSLayoutConstraint.activate(selfConstraints)
    }

    private static func generateItemSize(width: CGFloat) -> CGSize {
        let beteweenHorizontalMargin = margin
        let edgesMargins = edges.left + edges.right
        let allMargins = edgesMargins + beteweenHorizontalMargin
        let sizeWithoutMargins = width - allMargins
        let size = sizeWithoutMargins / columns
        return CGSize(width: size, height: size)
    }

}

// MARK: - Collection view wrapper

extension FoodListCollectionView {

    var dataSource: UICollectionViewDataSource? {
        get { return collection.dataSource }
        set { collection.dataSource = newValue }
    }

    func reloadData() {
        collection.reloadData()
    }

}
