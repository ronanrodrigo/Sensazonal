import UIKit

class FoodListCollectionViewController: UICollectionViewController, FoodListBinder {

    private var viewModel: FoodListViewModel = FoodListViewModel() {
        didSet { collectionView?.reloadData() }
    }

    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        self.collectionView!.register(FoodViewCell.self, forCellWithReuseIdentifier: FoodViewCell.identifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bind(viewModel: FoodListViewModel) {
        self.viewModel = viewModel
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.foodsViewModel.count
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodViewCell.identifier, for: indexPath)
        guard let foodCell = cell as? FoodViewCell else { return cell }

        let foodViewModel = viewModel.foodsViewModel[indexPath.row]
        foodCell.bind(viewModel: foodViewModel)

        return cell
    }

}
