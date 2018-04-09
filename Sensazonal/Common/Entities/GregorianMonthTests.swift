import XCTest
@testable import Sensazonal

final class GregorianMonthTests: XCTestCase {

    func testInitWithValidNumberDoesntThrowsError() {
        XCTAssertNoThrow(try GregorianMonth(number: 1))
    }

    func testPositionWhenValidMonthThenIsEqualToMonthNumberMinusOne() throws {
        let monthNumber = 1

        let month = try GregorianMonth(number: monthNumber)

        XCTAssertEqual(month.position, monthNumber - 1)
    }

    func testNameWhenValidMonthThenIsEqualToGregorianMonthName() throws {
        let month = try GregorianMonth(number: 1)

        XCTAssertEqual(month.name, "Janeiro")
    }

    func testInitWithInvalidNumberThrowsError() {
        XCTAssertThrowsError(try GregorianMonth(number: -1))
        XCTAssertThrowsError(try GregorianMonth(number: 0))
        XCTAssertThrowsError(try GregorianMonth(number: 13))
    }

    func testPositionWhenCurrentMonthThenIsEqualToMonthNumberMinusOne() {
        let currentMonthNumber = Calendar(identifier: .gregorian).component(.month, from: Date())

        let month = GregorianMonth()

        XCTAssertEqual(month.position, currentMonthNumber - 1)
    }

    func testNameWhenCurrentMonthThenIsEqualToGregorianMonthName() {
        let currentMonthNumber = Calendar(identifier: .gregorian).component(.month, from: Date())

        let month = GregorianMonth()

        XCTAssertEqual(month.name, DateFormatter().monthSymbols[currentMonthNumber - 1].capitalized)
    }

}
