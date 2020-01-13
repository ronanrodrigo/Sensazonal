import UIKit

protocol FoodDetailViewControllable {
    func bind(viewModel: FoodViewModel)
}

class FoodDetailViewController: UIViewController, FoodDetailViewControllable {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func bind(viewModel: FoodViewModel) {
        title = viewModel.name
    }

}
