import UIKit

struct FoodListViewControllerFactory {

    static func make() -> UIViewController {
        let controller = FoodListControllerFactory.make()
        return controller.viewController
    }

}
