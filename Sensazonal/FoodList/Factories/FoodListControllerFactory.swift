import UIKit

struct FoodListControllerFactory {

    static func make() -> BaseController {
        let listViewController = FoodListViewControllerFactory.make()
        let presenter = ListFoodViewPresenterFactory.make(binder: listViewController)
        let interactor = ListFoodByMonthInteractorFactory.make(presenter: presenter)
        let controller = FoodListController(interactor: interactor, listViewController: listViewController)
        listViewController.delegate = controller
        return controller
    }

}
