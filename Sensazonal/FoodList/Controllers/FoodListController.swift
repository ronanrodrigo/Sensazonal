import UIKit

class FoodListController {

    let viewController = FoodListCollectionViewController()
    private let listFoodByMonth: ListFoodByMonthInteractor

    init() {
        let presenter = ListFoodViewPresenterFactory.make(binder: viewController)
        listFoodByMonth = ListFoodByMonthInteractorFactory.make(presenter: presenter)
        listFoodByMonth.list(byMonth: 4)
    }

}
