import XCTest
import SensazonalTestUtils
@testable import Sensazonal

final class FoodListViewModelTests: XCTestCase {

    func testInitWithEmptyFoodsViewModel() {
        let viewModel = FoodListViewModel()

        XCTAssertTrue(viewModel.foodsViewModel.isEmpty)
        XCTAssertEqual(viewModel.month.name, GregorianMonth().name)
    }

    func testInitWithFoodsViewModel() throws {
        let foodViewModel = [FoodGroupViewModel.sample: [FoodViewModel.sample]]
        let viewModel = FoodListViewModel(foodsViewModel: foodViewModel, month: try GregorianMonth(number: 1))

        XCTAssertEqual(viewModel.foodsViewModel.count, 1)
        XCTAssertEqual(viewModel.month.name, "Janeiro")
    }

    func testFoodsWhenUnexistGroupThenReturnEmptyArray() throws {
        let foodViewModel = [FoodGroupViewModel.sample: [FoodViewModel.sample]]
        let viewModel = FoodListViewModel(foodsViewModel: foodViewModel, month: try GregorianMonth(number: 1))

        let foods = viewModel.foods(at: FoodGroupViewModel(name: "🏃‍♀️"))

        XCTAssertTrue(foods.isEmpty)
    }

    func testFoodsWhenExistGroupThenReturnNotEmptyArray() throws {
        let foodViewModel = [FoodGroupViewModel.sample: [FoodViewModel.sample]]
        let viewModel = FoodListViewModel(foodsViewModel: foodViewModel, month: try GregorianMonth(number: 1))

        let foods = viewModel.foods(at: .sample)

        XCTAssertEqual(foods.count, 1)
    }

    func testGroupsWhenExistGroupThenReturnNotEmptyArray() throws {
        let foodViewModel = [FoodGroupViewModel.sample: [FoodViewModel.sample]]
        let viewModel = FoodListViewModel(foodsViewModel: foodViewModel, month: try GregorianMonth(number: 1))

        let groups = viewModel.groups()

        XCTAssertEqual(groups.count, 1)
    }

}
