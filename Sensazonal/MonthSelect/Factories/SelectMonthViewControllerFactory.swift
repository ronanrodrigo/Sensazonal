import UIKit

struct SelectMonthViewControllerFactory {

    static func make(delegate: SelectMonthDelegate) -> UIViewController {
        let viewController = SelectMonthViewController()
        viewController.delegate = delegate
        let viewModel = SelectMonthViewModelFactory.make()
        viewController.bind(viewModel: viewModel)
        return viewController
    }

}
