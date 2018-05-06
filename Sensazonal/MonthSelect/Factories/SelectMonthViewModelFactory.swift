struct SelectMonthViewModelFactory {

    static func make(month: Month = MonthFactory.make()) -> SelectMonthViewModel {
        return SelectMonthViewModel(currentMonth: month)
    }

}
