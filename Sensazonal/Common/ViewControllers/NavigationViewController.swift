import UIKit

final class NavigationViewController: UINavigationController {

    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        setup()
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) { Logger.shared.notImplemented(); return nil }

    private func setup() {
        navigationBar.prefersLargeTitles = true
        navigationBar.backgroundColor = .white
        navigationBar.barTintColor = .white
        navigationBar.shadowImage = UIImage()
    }

}
