import UIKit

extension UIStoryboardSegue {
    func prepareFoodDetail(_ indexPath: IndexPath?, fn: (IndexPath) -> FoodViewModel?) {
        guard identifier == "OpenFoodDetail",
            let viewController = destination as? FoodDetailViewControllable,
            let indexPath = indexPath,
            let viewModel = fn(indexPath) else { return }
        viewController.bind(viewModel: viewModel)
    }
}
