import UIKit

final class SelectMonthTransitionFactory {

    static func make(viewController: SelectMonthViewController, interactiveTransition: InteractiveTransition) -> SelectMonthTransition {
        return SelectMonthTransition(viewController: viewController, interactiveTransition: interactiveTransition,
                                     delegate: viewController.delegate)
    }

}
