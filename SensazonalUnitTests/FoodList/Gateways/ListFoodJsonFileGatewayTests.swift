import XCTest
@testable import Sensazonal

final class ListFoodJsonFileGatewayTests: XCTestCase {

    func testListWhenHasFoodsInMonthThenReturnNotEmptyArray() {
        let gatewayExpectation = expectation(description: #function)
        var foods: [Food] = []

        ListFoodJsonFileGateway().foods(byMonth: 1) {
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

        ListFoodJsonFileGateway().foods(byMonth: -1) {
            $0.onSuccess { foods = $0; gatewayExpectation.fulfill() }
        }

        waitForExpectations(timeout: 1) { error in
            XCTAssertNil(error)
            XCTAssertTrue(foods.isEmpty)
        }
    }

}
