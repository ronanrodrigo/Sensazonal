import XCTest
import FBSnapshotTestCase
import SensazonalTestUtils
@testable import Sensazonal

final class FoodListViewControllerTests: FBSnapshotTestCase {

    private let foodViewModel = [FoodGroupViewModel.sample: [FoodViewModel.sample, .sample]]

    func testBindViewModelThePresentViewControllerWithCollectionView() {
        let viewController = FoodListViewController()
        let month = try! GregorianMonth(number: 1) // swiftlint:disable:this force_try
        let viewModel = FoodListViewModel(foodsViewModel: foodViewModel, month: month)

        viewController.bind(viewModel: viewModel)

        FBSnapshotVerifyView(viewController.view)
        FBSnapshotVerifyLayer(viewController.view.layer)
    }

}
