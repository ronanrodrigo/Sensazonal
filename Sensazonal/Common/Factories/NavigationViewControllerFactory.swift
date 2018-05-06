import UIKit

struct NavigationViewControllerFactory {

    static func make(rootViewController: UIViewController) -> UINavigationController {
        return NavigationViewController(rootViewController: rootViewController)
    }

}
