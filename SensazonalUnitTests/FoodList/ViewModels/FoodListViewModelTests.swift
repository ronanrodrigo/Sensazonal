import XCTest
@testable import Sensazonal

final class FoodListViewModelTests: XCTestCase {

    func testInitWithEmptyFoodsViewModel() {
        let viewModel = FoodListViewModel()

        XCTAssertTrue(viewModel.foodsViewModel.isEmpty)
        XCTAssertEqual(viewModel.monthSelected, "")
    }

    func testInitWithFoodsViewModel() {
        let foodViewModel = FoodViewModel(name: "", nameColor: .black, nameBackgroundColor: .white, photo: UIImage())
        let viewModel = FoodListViewModel(foodsViewModel: [foodViewModel], monthSelected: "Janeiro")

        XCTAssertEqual(viewModel.foodsViewModel.count, 1)
        XCTAssertEqual(viewModel.monthSelected, "Janeiro")
    }

}
