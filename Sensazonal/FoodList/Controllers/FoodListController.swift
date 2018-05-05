import UIKit

class FoodListController: BaseController {
    let viewController: UIViewController
    private let listFoodByMonth: ListFoodByMonthInteractor
    private var selectMonthViewController: UIViewController!

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

    func openMonthSelector() {
        selectMonthViewController = SelectMonthViewControllerFactory.make(delegate: self)
        viewController.present(selectMonthViewController, animated: true, completion: nil)
    }

    func updateList(with month: Month) {
        listFoodByMonth.list(byMonth: month.number)
    }
}
