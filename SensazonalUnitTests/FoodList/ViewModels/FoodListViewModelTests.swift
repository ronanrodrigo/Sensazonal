import XCTest
@testable import Sensazonal

final class FoodListViewModelTests: XCTestCase {

    func testInitWithEmptyFoodsViewModel() {
        let viewModel = FoodListViewModel()

        XCTAssertTrue(viewModel.foodsViewModel.isEmpty)
        XCTAssertEqual(viewModel.month.name, GregorianMonth().name)
    }

    func testInitWithFoodsViewModel() throws {
        let foodViewModel = FoodViewModel(FoodViewModelParams("", .black, .white, UIImage()))
        let viewModel = FoodListViewModel(foodsViewModel: [foodViewModel], month: try GregorianMonth(number: 1))

        XCTAssertEqual(viewModel.foodsViewModel.count, 1)
        XCTAssertEqual(viewModel.month.name, "Janeiro")
    }

}
