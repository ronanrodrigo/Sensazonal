import UIKit

struct RootViewControllerFactory {

    static func make() -> UIViewController {
        let rootViewController = FoodListViewControllerFactory.make()
        return NavigationViewControllerFactory.make(rootViewController: rootViewController)
    }

}
