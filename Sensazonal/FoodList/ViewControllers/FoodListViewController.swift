import UIKit

final class FoodListViewController: UIViewController {

    private var selectedMonth = MonthFactory.make()
    private var viewModel = FoodListViewModel()
    private lazy var foodListView = FoodListViewFacotry.make(dataProvider: self)
    weak var delegate: FoodListControllerDelegate?

    override func viewDidLoad() {
        view.addSubview(foodListView)
        navigationItem.rightBarButtonItem = MonthSelectorBarButton { [weak self] in
            guard let this = self else { return }
            this.delegate?.openMonthSelector(at: this.selectedMonth)
        }
    }

}

extension FoodListViewController: FoodListBinder {

    func bind(viewModel: FoodListViewModel) {
        self.viewModel = viewModel
        title = viewModel.month.name
        selectedMonth = viewModel.month
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
