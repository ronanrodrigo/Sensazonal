struct MonthFactory {

    static func make() -> Month {
        return GregorianMonth()
    }

    static func make(number: Int) throws -> Month {
        return try GregorianMonth(number: number)
    }

    static func make() -> Month.Type {
        return GregorianMonth.self
    }

}
