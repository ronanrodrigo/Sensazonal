import UIKit

class FoodListController {

    lazy var viewController = NavigationViewControllerFactory.make(rootViewController: listViewController)
    private let listViewController = FoodListViewControllerFactory.make()
    private let listFoodByMonth: ListFoodByMonthInteractor

    init(interactorBuilder: (ListFoodPresenter) -> ListFoodByMonthInteractor = ListFoodByMonthInteractorFactory.make) {
        let presenter = ListFoodViewPresenterFactory.make(binder: listViewController)
        listFoodByMonth = interactorBuilder(presenter)
        listFoodByMonth.listByCurrentMonth()
    }

}
