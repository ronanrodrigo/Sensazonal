import UIKit

class SelectMonthPickerViewController: UIViewController {

    private let months: [String]
    private let currentMonth: Month

    private lazy var monthPicker: MonthPicker = {
        let picker = MonthPicker(delegateAndDataSource: self)
        picker.selectMonth(monthNumber: self.currentMonth.position)
        return picker
    }()

    init(months: [String], currentMonth: Month) {
        self.months = months
        self.currentMonth = currentMonth
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overCurrentContext
        view.addSubview(monthPicker)
    }

    required init?(coder aDecoder: NSCoder) { Logger.shared.notImplemented(); return nil }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        monthPicker.toggleVisibility()
    }

}

extension SelectMonthPickerViewController: UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return months.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return months[row]
    }
}
