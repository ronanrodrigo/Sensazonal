import XCTest
import SensazonalTestUtils
@testable import Sensazonal

final class ListFoodByMonthInteractorTests: XCTestCase {

    private var gateway: ListFoodStubGateway!
    private var presenter: ListFoodStubPresenter!
    private var interactor: ListFoodByMonthInteractor!

    override func setUp() {
        super.setUp()
        gateway = ListFoodStubGateway()
        presenter = ListFoodStubPresenter()
        interactor = ListFoodByMonthInteractor(gateway: gateway, presenter: presenter)
    }

    func testListWhenExistingMonthThenPresentFoodsForSelectedMonth() {
        gateway.stubResult = Result.success([Food(keyName: "", keyGroup: "", months: [1])])

        interactor.list(byMonth: 1)

        XCTAssertEqual(presenter.listedFoods.count, 1)
    }

    func testListByCurrentMonthWhenExistingMonthThenPresentFoodsForSelectedMonth() {
        gateway.stubResult = Result.success([Food(keyName: "", keyGroup: "", months: [MonthFactory.make().number])])

        interactor.listByCurrentMonth()

        XCTAssertFalse(presenter.listedFoods.isEmpty)
        XCTAssertEqual(presenter.presentedMonthNumber, GregorianMonth().number)
    }

    func testListWhenMonthNumberIsGreaterThanTwelveThenPresentError() {
        interactor.list(byMonth: 13)

        XCTAssertEqual(presenter.presentedError, SensazonalError.invalidMonth)
        XCTAssertFalse(presenter.didPresentFoodsStub)
    }

    func testListWhenMonthNumberIsLowerThanOneThenPresentError() {
        interactor.list(byMonth: 0)

        XCTAssertEqual(presenter.presentedError, SensazonalError.invalidMonth)
        XCTAssertFalse(presenter.didPresentFoodsStub)
    }

    func testListWhenOccurAnToGetFoodsThenPresentError() {
        let gateway = ListFoodStubGateway()
        interactor = ListFoodByMonthInteractor(gateway: gateway, presenter: presenter)

        interactor.list(byMonth: 1)

        XCTAssertEqual(presenter.presentedError, SensazonalError.unknown)
        XCTAssertFalse(presenter.didPresentFoodsStub)
    }

}
