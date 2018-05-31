import XCTest
import SensazonalTestUtils
@testable import Sensazonal

final class ListFoodViewPresenterTests: XCTestCase {

    func testPresentFoodsWhenHasFoodsThenCallBinder() {
        let binder = StubBinder()
        let presenter = ListFoodViewPresenter(binder: binder)

        presenter.presentFoods([Food(keyName: "", keyGroup: "", months: [])], monthNumber: 1)

        XCTAssertTrue(binder.didCallBinder)
    }

    func testPresentFoodsWhenHasFoodsThenGenerateValidViewModel() {
        let binder = StubBinder()
        let presenter = ListFoodViewPresenter(binder: binder)

        presenter.presentFoods([Food(keyName: "", keyGroup: "", months: [])], monthNumber: 1)

        XCTAssertEqual(binder.viewModel?.foodsViewModel.count, 1)
        XCTAssertEqual(binder.viewModel?.month.name, "Janeiro")
    }

    func testPresentFoodsWhenInvalidMonthThenDontCallBinder() {
        let binder = StubBinder()
        let presenter = ListFoodViewPresenter(binder: binder)

        presenter.presentFoods([Food(keyName: "", keyGroup: "", months: [])], monthNumber: 0)

        XCTAssertFalse(binder.didCallBinder)
    }

}
