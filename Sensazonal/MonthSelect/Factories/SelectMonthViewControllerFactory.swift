import UIKit

struct SelectMonthViewControllerFactory {

    static func make(delegate: FoodListControllerDelegate, interactor: InteractiveTransition) -> UIViewController & SelectMonthBinder {
        let viewController = SelectMonthViewController()
        viewController.interactiveTransition = interactor
        viewController.delegate = delegate
        return viewController
    }

}
