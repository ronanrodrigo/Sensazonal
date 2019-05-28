enum MonthGatewayFactory {

    static func make() -> MonthGateway {
        return GenericMonthGateway<GregorianMonth>()
    }

}

// sourcery: AutoMock
public protocol MonthGateway {
    func current() -> Month
    func month(number: Int) throws -> Month
    func all() -> [Month]
}

final class GenericMonthGateway<M: Month>: MonthGateway {
    
    private lazy var allMonths = (1...12).compactMap { try? M(number: $0) }

    func current() -> Month {
        return M()
    }

    func month(number: Int) throws -> Month {
        return try M(number: number)
    }

    func all() -> [Month] {
        return allMonths
    }

}
