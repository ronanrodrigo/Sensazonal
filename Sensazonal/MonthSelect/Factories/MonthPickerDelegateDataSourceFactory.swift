struct MonthPickerDelegateDataSourceFactory {

    private init() { }

    static func make(dataProvider: MonthSelectorDataProvider) -> MonthPickerDelegateDataSource {
        return MonthPickerDelegateDataSource(dataProvider: dataProvider)
    }

}
