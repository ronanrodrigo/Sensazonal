import UIKit

class FoodListCollectionViewController: UIViewController {

    private var viewModel = FoodListViewModel()
    private lazy var selectMonthViewController = SelectMonthViewControllerFactory.make(viewModel.monthNames, viewModel.month)

    private lazy var foodListView: FoodListCollectionView = {
        let view = FoodListCollectionView()
        view.setupDataSource(self)
        return view
    }()

    override func viewDidLoad() {
        view.addSubview(foodListView)
        navigationItem.rightBarButtonItem = MonthSelectorBarButton(firstAction: weak(self) { $0.openMonthSelector() },
                                                                   secondAction: weak(self) { $0.closeMonthSelector() })
    }

    private func openMonthSelector() {
        print(#function)
    }

    private func closeMonthSelector() {
        print(#function)
    }

}

extension FoodListCollectionViewController: FoodListBinder {

    func bind(viewModel: FoodListViewModel) {
        self.viewModel = viewModel
        title = viewModel.month.name
        foodListView.reloadData()
    }

}

extension FoodListCollectionViewController: UICollectionViewDataSource {

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
