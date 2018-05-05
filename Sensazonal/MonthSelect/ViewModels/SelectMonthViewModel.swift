class SelectMonthViewModel {
    let months: [Month]
    let currentMonth: Month

    init(currentMonth: Month) {
        self.currentMonth = currentMonth
        self.months = MonthFactory.type.allMonths
    }

    func monthNameAt(_ position: Int) -> String {
        return months[position].name
    }
}
