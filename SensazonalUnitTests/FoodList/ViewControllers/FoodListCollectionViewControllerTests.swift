import XCTest
@testable import Sensazonal

final class FoodListCollectionViewControllerTests: XCTestCase {

    func testBindViewModelThenPopulateCollectionView() {
        let viewController = FoodListCollectionViewController()
        let foodViewModel = FoodViewModel(name: "Name", nameColor: .black, nameBackgroundColor: .white, photo: UIImage())
        let viewModel = FoodListViewModel(foodsViewModel: [foodViewModel], monthSelected: "Janeiro")

        viewController.bind(viewModel: viewModel)

        XCTAssertEqual(viewController.numberOfItemsImSection(0), 1)
    }

    func testNotCallBindViewModelThenGenerateEmptyDataSource() {
        let viewController = FoodListCollectionViewController()

        XCTAssertEqual(viewController.numberOfItemsImSection(0), 0)
    }

}
