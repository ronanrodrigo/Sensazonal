import XCTest
@testable import Core

final class ListFoodInteractorTests: XCTestCase {

    private let gateway = ListFoodGatewayMock()
    private let presenter = ListFoodPresenterMock()
    private lazy var interactor = ListFoodInteractor(gateway: gateway, presenter: presenter, monthGateway: MonthGatewayFactory.make())
    private let emptyGroup = [GroupedFoods(uuid: UUID(), name: "", foods: [])]

    func testListWhenExistingMonthThenPresentFoodsForSelectedMonth() {
        gateway.allByMonthOnCompleteClosure = { month, onComplete in
            onComplete(.success(self.emptyGroup))
        }

        interactor.list(forMonth: 1)

        XCTAssertEqual(presenter.presentGroupedFoodsMonthCallsCount, 1)
    }

    func testListByCurrentMonthWhenExistingMonthThenPresentFoodsForSelectedMonth() throws {
        gateway.allByMonthOnCompleteClosure = { month, onComplete in
            onComplete(.success(self.emptyGroup))
        }

        interactor.list()

        XCTAssertEqual(presenter.presentGroupedFoodsMonthReceivedArguments.month.number, GregorianMonth().number)
        XCTAssertEqual(presenter.presentGroupedFoodsMonthCallsCount, 1)
    }

    func testListWhenMonthNumberIsGreaterThanTwelveThenPresentError() {
        interactor.list(forMonth: 13)

        XCTAssertEqual(presenter.presentErrorReceivedError, .invalidMonth)
        XCTAssertFalse(presenter.presentGroupedFoodsMonthCalled)
    }

    func testListWhenMonthNumberIsLowerThanOneThenPresentError() {
        interactor.list(forMonth: 0)

        XCTAssertEqual(presenter.presentErrorReceivedError, .invalidMonth)
        XCTAssertFalse(presenter.presentGroupedFoodsMonthCalled)
    }

    func testListWhenOccurAnErrorToGetFoodsThenPresentError() {
        gateway.allByMonthOnCompleteClosure = { _, onComplete in
            onComplete(.failure(.invalid))
        }

        interactor.list(forMonth: 1)

        XCTAssertEqual(presenter.presentErrorReceivedError, .invalid)
        XCTAssertFalse(presenter.presentGroupedFoodsMonthCalled)
    }

}
