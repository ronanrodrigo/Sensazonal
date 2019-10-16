@testable import Core
@testable import Share
import XCTest

final class ListFoodGatewayLocalTests: XCTestCase {

    private let gateway = ListFoodGatewayLocal()
    private let currentMonth = MonthGatewayFactory.make().current()
    private let invalidGateway = ListFoodGatewayLocal(fileName: "Invalid")
    
    func test_allByMonth_nilJsonUrl_callCompleteWithNotFoundError() {
        let waitExpectation = expectation()
        var expectedError: ListFoodError?
        
        invalidGateway.all(byMonth: currentMonth) {
            expectedError = $0.error
            waitExpectation.fulfill()
        }

        waitForExpectations {
            XCTAssertEqual(expectedError, .notFound)
        }
    }

    func test_allByMonth_notNilJsonUrl_callCompleteWithoutError() {
        let waitExpectation = expectation()
        var expectedError: ListFoodError?

        gateway.all(byMonth: currentMonth) {
            expectedError = $0.error
            waitExpectation.fulfill()
        }

        waitForExpectations {
            XCTAssertNil(expectedError)
        }
    }

    func test_allByMonth_notExistingMonth_callCompletionWithEmptyItems() {
        let waitExpectation = expectation()
        let month = NotExistingMonth()
        var expectedGroupedFoods: [GroupedFoods]?

        gateway.all(byMonth: month) {
            expectedGroupedFoods = $0.data
            waitExpectation.fulfill()
        }

        waitForExpectations {
            XCTAssertEqual(expectedGroupedFoods?.isEmpty, true)
        }
    }

    func test_allByMonth_existingMonth_callCompletionWithItems() throws {
        let waitExpectation = expectation()
        let month = try MonthGatewayFactory.make().month(number: 1)
        var expectedGroupedFoods: [GroupedFoods]?

        gateway.all(byMonth: month) {
            expectedGroupedFoods = $0.data
            waitExpectation.fulfill()
        }

        waitForExpectations {
            XCTAssertEqual(expectedGroupedFoods?.isEmpty, false)
            XCTAssertEqual(expectedGroupedFoods?.first?.foods.isEmpty, false)
        }
    }

    func test_allByMonth_existingMonth_callCompletionWithItemsForSpecifcMonth() throws {
        let waitExpectation = expectation()
        let month = try MonthGatewayFactory.make().month(number: 1)
        var expectedFoods: [GroupedFoods.Food]?

        gateway.all(byMonth: month) {
            expectedFoods = $0.data.flatMap { $0.flatMap { $0.foods } }
            waitExpectation.fulfill()
        }

        waitForExpectations {
            XCTAssertEqual(expectedFoods?.count, 23)
        }
    }

    func test_allByMonth_invalidJson_callCompleteionWithError() {
        let waitExpectation = expectation()
        let gateway = ListFoodGatewayLocal(bundle: Bundle(for: ListFoodGatewayLocalTests.self), fileName: "Invalid")
        var expectedError: ListFoodError?

        gateway.all(byMonth: currentMonth) {
            expectedError = $0.error
            waitExpectation.fulfill()
        }

        waitForExpectations {
            XCTAssertEqual(expectedError, .invalid)
        }
    }

}

extension XCTestCase {
    func waitForExpectations(handler: @escaping () -> Void) {
        waitForExpectations(timeout: 2) { XCTAssertNil($0); handler() }
    }

    func expectation(_ description: String = #function) -> XCTestExpectation {
        return expectation(description: description)
    }
}

extension Result {
    var error: Failure? {
        if case let .failure(error) = self { return error }
        return nil
    }

    var data: Success? {
        if case let .success(data) = self { return data }
        return nil
    }
}

final class NotExistingMonth: Month {

    var number: Int
    var name: String { return "" }

    init() {
        self.number = .max
    }

    init(number: Int = 13) {
        self.number = number
    }
}
