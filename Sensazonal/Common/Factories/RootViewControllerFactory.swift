import UIKit

struct RootViewControllerFactory {

    static func make() -> UIViewController {
        let controller = FoodListControllerFactory.make()
        return NavigationViewControllerFactory.make(rootViewController: controller.viewController)
    }

}
