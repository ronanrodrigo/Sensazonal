@testable import Sensazonal

public final class StubMonthSelectorDataProvider: MonthSelectorDataProvider {

    private let months = MonthFactory.type.allMonths
    public var didMonthSelected = false
    public var didMonthSelectedWith: Int?

    public init() { }

    public func monthsTotal() -> Int {
        return months.count
    }

    public func monthName(in position: Int) -> String {
        return months[position].name
    }

    public func monthSelected(in position: Int) {
        didMonthSelected = true
        didMonthSelectedWith = position
    }

}
