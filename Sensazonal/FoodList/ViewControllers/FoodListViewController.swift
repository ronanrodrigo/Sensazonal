import UIKit

class FoodListViewController: UIViewController {

    private var viewModel = FoodListViewModel()
    private var selectMonthViewController: UIViewController!
    private lazy var foodListView = FoodListViewFacotry.make(dataProvider: self)

    override func viewDidLoad() {
        view.addSubview(foodListView)
        navigationItem.rightBarButtonItem = MonthSelectorBarButton(action: weak(self) { $0.openMonthSelector() })
    }

    private func openMonthSelector() {
        selectMonthViewController = SelectMonthViewControllerFactory.make(delegate: self)
        present(selectMonthViewController, animated: true, completion: nil)
    }

    private func closeMonthSelector() {
        selectMonthViewController.dismiss(animated: true, completion: nil)
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

extension FoodListViewController: SelectMonthDelegate {
    func didSelectMonth(_ month: Month) {
        print("\(#function) \(month)")
    }

    func didFinishSelection() {
        closeMonthSelector()
    }
}
