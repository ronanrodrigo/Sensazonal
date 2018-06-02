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

    func foodsQuantity(at section: Int) throws -> Int {
        let groupViewModel = try group(at: section)
        return viewModel.foods(at: groupViewModel).count
    }

    func groupsQuantity() -> Int {
        return viewModel.groups().count
    }

    func group(at section: Int) throws -> FoodGroupViewModel {
        guard viewModel.groups().indices.contains(section) else { throw SensazonalError.invalidSection }
        return viewModel.groups()[section]
    }

    func food(at indexPath: IndexPath) throws -> FoodViewModel {
        let groupViewModel = try group(at: indexPath.section)
        let foods = viewModel.foods(at: groupViewModel)
        guard foods.indices.contains(indexPath.row) else { throw SensazonalError.invalidRow }
        return foods[indexPath.row]
    }

}
