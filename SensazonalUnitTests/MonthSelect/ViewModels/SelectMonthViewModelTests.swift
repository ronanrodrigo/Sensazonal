import XCTest
@testable import Sensazonal

final class SelectMonthViewModelTests: XCTestCase {

    func testInitWhenMonthNumberIsOneIsOneThenCreateViewModelForJanuary() throws {
        let viewModel = SelectMonthViewModel(currentMonth: try MonthFactory.make(number: 1))

        XCTAssertEqual(viewModel.currentMonth.number, 1)
    }

    func testInitWhenAnyMonthThenCreateViewModelWithTwelveMonths() {
        let viewModel = SelectMonthViewModel(currentMonth: MonthFactory.make())

        XCTAssertEqual(viewModel.months.count, 12)
    }

}
