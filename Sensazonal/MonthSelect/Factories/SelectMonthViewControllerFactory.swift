import UIKit

struct SelectMonthViewControllerFactory {

    private init() { }

    static func make(delegate: FoodListControllerDelegate) -> UIViewController & SelectMonthBinder {
        let viewController = SelectMonthViewController()
        viewController.delegate = delegate
        return viewController
    }

}
