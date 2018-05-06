import UIKit

struct RootViewControllerFactory {

    private init() { }

    static func make(rootController controller: BaseController) -> UIViewController {
        return NavigationViewControllerFactory.make(rootViewController: controller.viewController)
    }

}
