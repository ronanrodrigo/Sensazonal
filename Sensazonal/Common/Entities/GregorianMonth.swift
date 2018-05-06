import Foundation

protocol Month {
    static var allMonths: [Month] { get }
    var number: Int { get }
    var position: Int { get }
    var name: String { get }
    init(number: Int) throws
    init(position: Int) throws
    init()
}

struct GregorianMonth: Month {
    static let allMonths: [Month] = (0...11).compactMap { try? GregorianMonth(position: $0) }
    let number: Int
    var position: Int { return number - 1 }
    var name: String { return GregorianMonth.monthName(position: position) }

    /**
     Init with gregorian month number.
     - Parameter number: The month number in gregorian calendar.
     - Throws: `SensazonalError.invalidMonth` if the `number` parameter is not between 1 and 12.
     */
    init(number: Int) throws {
        guard GregorianMonth.isValid(month: number) else { throw SensazonalError.invalidMonth }
        self.number = number
    }

    /**
     Init based on array position.
     - Parameter position: The position reference for the month number in gregorian calendar.
     - Throws: `SensazonalError.invalidMonth` if the `position + 1` parameter is not between 1 and 12.
     */
    init(position: Int) throws {
        try self.init(number: position + 1)
    }

    /// Init with current month number
    init() {
        let currentMonth = Calendar(identifier: .gregorian).component(.month, from: Date())
        self.number = currentMonth
    }

    static func isValid(month: Int) -> Bool {
        return (1...12) ~= month
    }

    private static func monthName(position: Int) -> String {
        return DateFormatter().monthSymbols[position].capitalized
    }

}
