import UIKit

struct NavigationViewControllerFactory {

    private init() { }

    static func make(rootViewController: UIViewController) -> UINavigationController {
        return NavigationViewController(rootViewController: rootViewController)
    }

}
