import Foundation

public protocol Month {

    var number: Int { get }
    var name: String { get }
    init(number: Int) throws
    init()

}

struct GregorianMonth: Month {
    let number: Int
    var name: String { return GregorianMonth.monthName(position: number - 1) }
    private var calendar = Calendar(identifier: .gregorian)

    /// Creates a new instance by using an give month number.
    ///
    /// This initializer throws an `GregorianMonthError.invalidMonth` if the `number` parameter is not between 1 and 12.
    /// - Parameter number: The month number in gregorian calendar.
    init(number: Int) throws {
        guard GregorianMonth.isValid(month: number) else {
            throw GregorianMonthError.invalidMonth
        }
        self.number = number
    }

    /// Creates a new instance by using current month number.
    init() {
        let currentMonth = calendar.component(.month, from: Date())
        self.number = currentMonth
    }

    private static func isValid(month: Int) -> Bool {
        return (1...12) ~= month
    }

    private static func monthName(position: Int) -> String {
        return DateFormatter().monthSymbols[position].capitalized
    }

}
