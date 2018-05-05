import UIKit

struct SelectMonthViewControllerFactory {

    static func make(delegate: FoodListControllerDelegate) -> UIViewController {
        let viewController = SelectMonthViewController()
        viewController.delegate = delegate
        let viewModel = SelectMonthViewModelFactory.make()
        viewController.bind(viewModel: viewModel)
        return viewController
    }

}
