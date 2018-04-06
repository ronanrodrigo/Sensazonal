import Foundation

struct Month {

    static var currentMonthNumber: Int {
        return Calendar.current.component(.month, from: Date())
    }

    /// The month number in real world. Between 1 and 12.
    let number: Int
    var name: String { return DateFormatter().monthSymbols[position].capitalized }
    private var position: Int { return number - 1 }

    static func isValid(monthNumber: Int) -> Bool {
        return (1...12) ~= monthNumber
    }

}

extension Month {
    init() {
        self.number = Month.currentMonthNumber
    }
}
