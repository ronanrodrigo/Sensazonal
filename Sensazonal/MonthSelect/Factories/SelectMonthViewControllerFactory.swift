import UIKit

struct SelectMonthViewControllerFactory {

    static func make(delegate: FoodListControllerDelegate, interactor: InteractiveTransition) -> UIViewController & SelectMonthBinder {
        let viewController = SelectMonthViewController()
        viewController.interactor = interactor
        viewController.delegate = delegate
        return viewController
    }

}
