import XCTest
import SensazonalTestUtils
@testable import Sensazonal

final class ListFoodJsonFileGatewayTests: XCTestCase {

    private var gateway: ListFoodJsonFileGateway!

    override func setUp() {
        super.setUp()
        gateway = ListFoodJsonFileGateway(isFavoriteFoodGateway: IsFavoriteFoodStubGateway())
    }

    func testListWhenHasFoodsInMonthThenReturnNotEmptyArray() {
        let gatewayExpectation = expectation(description: #function)
        var foods: [Food] = []

        gateway.foods(byMonth: 1) {
            $0.onSuccess { foods = $0; gatewayExpectation.fulfill() }
        }

        waitForExpectations(timeout: 1) { error in
            XCTAssertNil(error)
            XCTAssertFalse(foods.isEmpty)
        }
    }

    func testListWhenHasNotFoodsInMothThenReturnEmptyArray() {
        let gatewayExpectation = expectation(description: #function)
        var foods: [Food] = []

        gateway.foods(byMonth: -1) {
            $0.onSuccess { foods = $0; gatewayExpectation.fulfill() }
        }

        waitForExpectations(timeout: 1) { error in
            XCTAssertNil(error)
            XCTAssertTrue(foods.isEmpty)
        }
    }

}
