import UIKit

final class FoodListController: BaseController {

    let viewController: UIViewController
    private let listFoodByMonth: ListFoodByMonthInteractor
    private lazy var selectMonthViewController = SelectMonthViewControllerFactory.make(delegate: self)
    private lazy var favoritateFood = FavoritateFoodInteractorFactory.make(presenter: FavoriteFoodViewPresenter())

    init(interactor: ListFoodByMonthInteractor, listViewController: UIViewController) {
        self.viewController = listViewController
        listFoodByMonth = interactor
        listFoodByMonth.listByCurrentMonth()
    }

}

extension FoodListController: FoodListControllerDelegate {

    func closeMonthSelector() {
        selectMonthViewController.dismiss(animated: true, completion: nil)
    }

    func openMonthSelector(at month: Month) {
        let viewModel = SelectMonthViewModelFactory.make(month: month)
        selectMonthViewController.bind(viewModel: viewModel)
        viewController.present(selectMonthViewController, animated: true, completion: nil)
    }

    func updateList(with month: Month) {
        listFoodByMonth.list(byMonth: month.number)
    }

    func favoritate(foodKeyName: KeyName) {
        favoritateFood.favorite(keyName: foodKeyName)
    }

}

final class FavoriteFoodViewPresenter: FavoriteFoodPresenter {

    func favorited(keyName: KeyName) {
        print("\(#function) \(keyName)")
    }

    func unfavorited(keyName: KeyName) {
        print("\(#function) \(keyName)")
    }

    func presentError(error: SensazonalError) {
    }

}
