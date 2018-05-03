import UIKit

class FoodListCollectionViewController: UIViewController {

    private var viewModel = FoodListViewModel()
    private var selectMonthViewController: UIViewController!
    private lazy var foodListView = FoodListViewFacotry.make(dataSource: self)

    override func viewDidLoad() {
        view.addSubview(foodListView)
        navigationItem.rightBarButtonItem = MonthSelectorBarButton(selectAction: weak(self) { $0.openMonthSelector() })
    }

    private func openMonthSelector() {
        selectMonthViewController = SelectMonthViewControllerFactory.make(delegate: self)
        present(selectMonthViewController, animated: true, completion: nil)
    }

    private func closeMonthSelector() {
        selectMonthViewController.dismiss(animated: true, completion: nil)
    }

}

extension FoodListCollectionViewController: FoodListBinder {

    func bind(viewModel: FoodListViewModel) {
        self.viewModel = viewModel
        title = viewModel.month.name
        foodListView.reload()
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

extension FoodListCollectionViewController: SelectMonthDelegate {
    func didSelectMonth(_ month: Month) {
        print("\(#function) \(month)")
    }

    func didFinishSelection() {
        closeMonthSelector()
    }
}
