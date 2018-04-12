import UIKit

class FoodListController {

    lazy var viewController = NavigationViewController(rootViewController: listViewController)
    private let listViewController = FoodListCollectionViewController()
    private let listFoodByMonth: ListFoodByMonthInteractor

    init(interactorBuilder: (ListFoodPresenter) -> ListFoodByMonthInteractor = ListFoodByMonthInteractorFactory.make) {
        let presenter = ListFoodViewPresenterFactory.make(binder: listViewController)
        listFoodByMonth = interactorBuilder(presenter)
        listFoodByMonth.listByCurrentMonth()
    }

}
