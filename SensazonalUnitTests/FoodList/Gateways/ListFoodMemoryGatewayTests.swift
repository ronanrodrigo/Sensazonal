import XCTest
@testable import Sensazonal

final class ListFoodMemoryGatewayTests: XCTestCase {

    func testListWhenHasFoodsInMonthThenReturnNotEmptyArray() {
        var foods: [Food] = []

        ListFoodMemoryGateway().filter(byMonth: 1) {
            $0.onSuccess({ foods = $0 })
        }

        XCTAssertFalse(foods.isEmpty)
    }

    func testListWhenHasNotFoodsInMothThenReturnEmptyArray() {
        var foods: [Food] = []

        ListFoodMemoryGateway().filter(byMonth: -1) {
            $0.onSuccess({ foods = $0 })
        }

        XCTAssertTrue(foods.isEmpty)
    }

}
