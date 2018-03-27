import UIKit

class NavigationViewController: UINavigationController {

    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)

        navigationBar.prefersLargeTitles = true
        navigationBar.backgroundColor = .white
        navigationBar.barTintColor = .white
        navigationBar.shadowImage = UIImage()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
