import UIKit

struct SelectMonthViewControllerFactory {

    static func make(delegate: FoodListControllerDelegate) -> UIViewController & SelectMonthBinder {
        let viewController = SelectMonthViewController()
        viewController.delegate = delegate
        return viewController
    }

}
