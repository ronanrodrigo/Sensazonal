@testable import Sensazonal

final class StubMonthSelectorDataProvider: MonthSelectorDataProvider {

    private let months = MonthFactory.type.allMonths
    var didMonthSelected = false
    var didMonthSelectedWith: Int?

    func monthsTotal() -> Int {
        return months.count
    }

    func monthName(in position: Int) -> String {
        return months[position].name
    }

    func monthSelected(in position: Int) {
        didMonthSelected = true
        didMonthSelectedWith = position
    }

}
