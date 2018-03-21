import UIKit

class FoodListController {

    lazy var viewController = UINavigationController(rootViewController: listViewController)
    let listViewController = FoodListCollectionViewController()
    private let listFoodByMonth: ListFoodByMonthInteractor

    init() {
        let presenter = ListFoodViewPresenterFactory.make(binder: listViewController)
        listFoodByMonth = ListFoodByMonthInteractorFactory.make(presenter: presenter)
        let currentMonth = Calendar.current.component(.month, from: Date())
        listFoodByMonth.list(byMonth: currentMonth)
        viewController.navigationBar.prefersLargeTitles = true
    }

}
