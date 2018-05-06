struct MonthPickerDelegateDataSourceFactory {

    static func make(dataProvider: MonthSelectorDataProvider) -> MonthPickerDelegateDataSource {
        return MonthPickerDelegateDataSource(dataProvider: dataProvider)
    }

}
