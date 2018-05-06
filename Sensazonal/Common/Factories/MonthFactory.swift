struct MonthFactory {

    private init() { }

    static func make() -> Month {
        return type.init()
    }

    static func make(number: Int) throws -> Month {
        return try type.init(number: number)
    }

    static func make(position: Int) throws -> Month {
        return try type.init(position: position)
    }

    static var type: Month.Type = {
        return GregorianMonth.self
    }()

}
