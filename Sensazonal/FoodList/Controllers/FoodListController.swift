import UIKit

class FoodListController {

    let viewController: UIViewController
    private let listFoodByMonth: ListFoodByMonthInteractor

    init(interactor: ListFoodByMonthInteractor, listViewController: UIViewController) {
        self.viewController = listViewController
        listFoodByMonth = interactor
        listFoodByMonth.listByCurrentMonth()
    }

}
