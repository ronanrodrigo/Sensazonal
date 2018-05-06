struct SelectMonthViewModelFactory {

    private init() { }

    static func make(month: Month = MonthFactory.make()) -> SelectMonthViewModel {
        return SelectMonthViewModel(currentMonth: month)
    }

}
