import XCTest
import FBSnapshotTestCase
@testable import Sensazonal

final class FoodListViewControllerTests: FBSnapshotTestCase {

    private var foodViewModel: FoodViewModel { return FoodViewModel.sample }

    func testBindViewModelThePresentViewControllerWithCollectionView() {
        let viewController = FoodListViewController()
        let month = try! GregorianMonth(number: 1) // swiftlint:disable:this force_try
        let viewModel = FoodListViewModel(foodsViewModel: [foodViewModel, foodViewModel, foodViewModel], month: month)

        viewController.bind(viewModel: viewModel)

        FBSnapshotVerifyView(viewController.view)
        FBSnapshotVerifyLayer(viewController.view.layer)
    }

}
