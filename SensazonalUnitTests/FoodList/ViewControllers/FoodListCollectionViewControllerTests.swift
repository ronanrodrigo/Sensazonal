import XCTest
import FBSnapshotTestCase
@testable import Sensazonal

final class FoodListCollectionViewControllerTests: FBSnapshotTestCase {

    private var foodViewModel: FoodViewModel {
        return FoodViewModel(name: "Name", nameColor: .white, nameBackgroundColor: .red, photo: #imageLiteral(resourceName: "content/strawberry"))
    }

    func testBindViewModelThenPopulateCollectionView() {
        let viewController = FoodListCollectionViewController()
        let viewModel = FoodListViewModel(foodsViewModel: [foodViewModel], monthSelected: "Janeiro", monthNumber: 0)

        viewController.bind(viewModel: viewModel)

        XCTAssertEqual(viewController.numberOfItemsImSection(0), 1)
    }

    func testNotCallBindViewModelThenGenerateEmptyDataSource() {
        let viewController = FoodListCollectionViewController()

        XCTAssertEqual(viewController.numberOfItemsImSection(0), 0)
    }

    func testBindViewModelThePresentViewControllerWithCollectionView() {
        let viewController = FoodListCollectionViewController()
        let viewModel = FoodListViewModel(foodsViewModel: [foodViewModel, foodViewModel, foodViewModel], monthSelected: "Janeiro", monthNumber: 0)

        viewController.bind(viewModel: viewModel)

        FBSnapshotVerifyView(viewController.view)
        FBSnapshotVerifyLayer(viewController.view.layer)
    }

}
