import UIKit

class FoodListViewController: UIViewController {
    private var viewModel = FoodListViewModel()
    private lazy var foodListView = FoodListViewFacotry.make(dataProvider: self)
    weak var delegate: FoodListControllerDelegate?

    override func viewDidLoad() {
        view.addSubview(foodListView)
        navigationItem.rightBarButtonItem = MonthSelectorBarButton { [weak self] in
            self?.delegate?.openMonthSelector()
        }
    }

}

extension FoodListViewController: FoodListBinder {
    func bind(viewModel: FoodListViewModel) {
        self.viewModel = viewModel
        title = viewModel.month.name
        foodListView.reload()
    }
}

extension FoodListViewController: FoodListDataProvider {
    func foodsTotal() -> Int {
        return viewModel.foodsViewModel.count
    }

    func food(at position: Int) -> FoodViewModel {
        return viewModel.foodsViewModel[position]
    }
}
