import UIKit

final class FoodListController: BaseController {

    let viewController: UIViewController
    private let listFoodByMonth: ListFoodByMonthInteractor
    private lazy var selectMonthViewController = SelectMonthViewControllerFactory.make(delegate: self)
    private let transition = FadeAndAppearTransitioningDelegate()

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
        selectMonthViewController = SelectMonthViewControllerFactory.make(delegate: self)

        let viewModel = SelectMonthViewModelFactory.make(month: month)
        selectMonthViewController.bind(viewModel: viewModel)
        selectMonthViewController.transitioningDelegate = transition
        selectMonthViewController.modalPresentationStyle = .custom

        viewController.present(selectMonthViewController, animated: true, completion: nil)
    }

    func updateList(with month: Month) {
        listFoodByMonth.list(byMonth: month.number)
    }

}
