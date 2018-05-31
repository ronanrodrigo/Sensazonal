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

    func foodsTotal(for section: Int) -> Int {
        let key = Array(viewModel.foodsViewModel.keys)[section]
        let values = viewModel.foodsViewModel[key]
        return values?.count ?? 0
    }

    func groupsTotal() -> Int {
        return viewModel.foodsViewModel.keys.count
    }

    func groupName(at section: Int) -> String {
        let groupKeyName = "\(Array(viewModel.foodsViewModel.keys)[section])S"
        return Locale.localize(groupKeyName)
    }

    func food(at indexPath: IndexPath) -> FoodViewModel {
        let key = Array(viewModel.foodsViewModel.keys)[indexPath.section]
        let values = viewModel.foodsViewModel[key]
        return values![indexPath.row]
    }

}
