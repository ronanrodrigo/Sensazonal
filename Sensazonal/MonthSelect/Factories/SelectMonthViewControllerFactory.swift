import UIKit

struct SelectMonthViewControllerFactory {

    static func make(delegate: FoodListControllerDelegate) -> UIViewController & SelectMonthBinder {
        let transition = FadeAndAppearTransitioningDelegate()
        let interactiveTransition = InteractiveTransition()
        let viewController = SelectMonthViewController(interactiveTransition: interactiveTransition, transition: transition)
        transition.interactiveTransition = interactiveTransition
        viewController.modalPresentationStyle = .custom
        viewController.transitioningDelegate = transition
        viewController.delegate = delegate
        return viewController
    }

}
