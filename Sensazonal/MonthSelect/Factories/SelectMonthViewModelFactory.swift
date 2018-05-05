struct SelectMonthViewModelFactory {

    static func make() -> SelectMonthViewModel {
        return SelectMonthViewModel(currentMonth: MonthFactory.make())
    }

}
