import UIKit

class FoodListCollectionViewController: UIViewController, UICollectionViewDataSource, FoodListBinder {

    private var viewModel = FoodListViewModel()
    private lazy var foodListView: FoodListCollectionView = {
        let view = FoodListCollectionView()
        view.setupDataSource(self)
        return view
    }()

    override func viewDidLoad() {
        view.addSubview(foodListView)
    }

    func bind(viewModel: FoodListViewModel) {
        self.viewModel = viewModel
        title = viewModel.monthSelected
        foodListView.reloadData()
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.foodsViewModel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodViewCell.identifier, for: indexPath)
        guard let foodCell = cell as? FoodViewCell else { return cell }

        let foodViewModel = viewModel.foodsViewModel[indexPath.row]
        foodCell.bind(viewModel: foodViewModel)

        return cell
    }

}
