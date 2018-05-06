import UIKit

struct RootViewControllerFactory {

    static func make(rootController controller: BaseController) -> UIViewController {
        return NavigationViewControllerFactory.make(rootViewController: controller.viewController)
    }

}
