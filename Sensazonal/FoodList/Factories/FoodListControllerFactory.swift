import UIKit

struct FoodListControllerFactory {

    static func make() -> FoodListController {
        let listViewController = FoodListViewControllerFactory.make()
        let presenter = ListFoodViewPresenterFactory.make(binder: listViewController)
        let interactor = ListFoodByMonthInteractorFactory.make(presenter: presenter)
        return FoodListController(interactor: interactor, listViewController: listViewController)
    }

}
