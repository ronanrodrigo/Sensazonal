import UIKit

class FoodListController {

    lazy var viewController = UINavigationController(rootViewController: listViewController)
    let listViewController = FoodListCollectionViewController()
    private let listFoodByMonth: ListFoodByMonthInteractor

    init() {
        let presenter = ListFoodViewPresenterFactory.make(binder: listViewController)
        listFoodByMonth = ListFoodByMonthInteractorFactory.make(presenter: presenter)
        listFoodByMonth.list(byMonth: 4)
    }

}
