import XCTest
@testable import Sensazonal

final class FoodListViewModelTests: XCTestCase {

    func testInitWithEmptyFoodsViewModel() {
        let viewModel = FoodListViewModel()

        XCTAssertTrue(viewModel.foodsViewModel.isEmpty)
        XCTAssertEqual(viewModel.month.name, Month().name)
    }

    func testInitWithFoodsViewModel() {
        let foodViewModel = FoodViewModel(name: "", nameColor: .black, nameBackgroundColor: .white, photo: UIImage())
        let viewModel = FoodListViewModel(foodsViewModel: [foodViewModel], month: Month(number: 1))

        XCTAssertEqual(viewModel.foodsViewModel.count, 1)
        XCTAssertEqual(viewModel.month.name, "Janeiro")
    }

}
