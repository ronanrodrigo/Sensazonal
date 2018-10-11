import XCTest
import SensazonalTestUtils
@testable import Sensazonal

final class ListFoodViewPresenterTests: XCTestCase {

    private let food = Food(key: .init("", ""), months: [], favorited: true)
    private var gateway: ListFoodJsonFileGateway!

    override func setUp() {
        super.setUp()
        gateway = ListFoodJsonFileGateway()
    }

    func testPresentFoodsWhenHasFoodsThenCallBinder() {
        let binder = StubBinder()
        let presenter = ListFoodViewPresenter(binder: binder)

        presenter.presentFoods([food], monthNumber: 1)

        XCTAssertTrue(binder.didCallBinder)
    }

    func testPresentFoodsWhenHasFoodsThenGenerateValidViewModel() {
        let binder = StubBinder()
        let presenter = ListFoodViewPresenter(binder: binder)

        presenter.presentFoods([food], monthNumber: 1)

        XCTAssertEqual(binder.viewModel?.foodsViewModel.count, 1)
        XCTAssertEqual(binder.viewModel?.month.name, "Janeiro")
    }

    func testPresentFoodsWhenInvalidMonthThenDontCallBinder() {
        let binder = StubBinder()
        let presenter = ListFoodViewPresenter(binder: binder)

        presenter.presentFoods([food], monthNumber: 0)

        XCTAssertFalse(binder.didCallBinder)
    }

    func testPresentFoodsWhenJanuaryThenGenerateGroupedViewModels() {
        var foods: [Food] = []
        let binder = FakeFoodListBinder()
        let presenter = ListFoodViewPresenter(binder: binder)
        let monthNumber = 1
        gateway.foods(byMonth: monthNumber) {
            $0.onSuccess { resultFoods in foods = resultFoods }
        }

        presenter.presentFoods(foods, monthNumber: monthNumber)

        let foodViewModels = binder.viewModel.foodsViewModel.values.reduce([], +)
        XCTAssertEqual(foods.count, foodViewModels.count)
    }

    func testPresentFoodsWhenFebruaryThenGenerateGroupedViewModels() {
        var foods: [Food] = []
        let binder = FakeFoodListBinder()
        let presenter = ListFoodViewPresenter(binder: binder)
        let monthNumber = 2
        gateway.foods(byMonth: monthNumber) {
            $0.onSuccess { resultFoods in foods = resultFoods }
        }

        presenter.presentFoods(foods, monthNumber: monthNumber)

        let foodViewModels = binder.viewModel.foodsViewModel.values.reduce([], +)
        XCTAssertEqual(foods.count, foodViewModels.count)
    }

    func testPresentFoodsWhenAllMonthsThenGenerateGroupedViewModels() {
        var foods: [Food] = []
        let monthNumbers = (1...12)

        for monthNumber in monthNumbers {
            let binder = FakeFoodListBinder()
            let presenter = ListFoodViewPresenter(binder: binder)
            gateway.foods(byMonth: monthNumber) {
                $0.onSuccess { resultFoods in foods = resultFoods }
            }

            presenter.presentFoods(foods, monthNumber: monthNumber)

            let foodViewModels = binder.viewModel.foodsViewModel.values.reduce([], +)
            XCTAssertEqual(foods.count, foodViewModels.count, "Wrong quanity of month: \(monthNumber)")
            return
        }

        XCTFail("The test did not run")
    }

}
