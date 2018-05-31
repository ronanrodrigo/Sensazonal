import XCTest
@testable import Sensazonal

final class ListFoodJsonFileGatewayTests: XCTestCase {

    func testListWhenHasFoodsInMonthThenReturnNotEmptyArray() {
        var foods: [Food] = []

        ListFoodJsonFileGateway().filter(byMonth: 1) {
            $0.onSuccess({ foods = $0 })
        }

        XCTAssertFalse(foods.isEmpty)
    }

    func testListWhenHasNotFoodsInMothThenReturnEmptyArray() {
        var foods: [Food] = []

        ListFoodJsonFileGateway().filter(byMonth: -1) {
            $0.onSuccess({ foods = $0 })
        }

        XCTAssertTrue(foods.isEmpty)
    }

}
