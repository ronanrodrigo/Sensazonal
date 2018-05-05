import UIKit

final class MonthPickerDelegateDataSource: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    private let dataProvider: MonthSelectorDataProvider

    init(dataProvider: MonthSelectorDataProvider) {
        self.dataProvider = dataProvider
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataProvider.monthsTotal()
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataProvider.monthName(in: row)
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dataProvider.monthSelected(in: row)
    }
}
