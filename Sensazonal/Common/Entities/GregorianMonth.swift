import Foundation

struct GregorianMonth {
    static var allMonths = (0...11).map(GregorianMonth.monthName)
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
