import UIKit

protocol SelectMonthDelegate: class {
    func didSelectMonth(_ month: Month)
    func didFinishSelection()
}

class SelectMonthPickerViewController: UIViewController {

    weak var delegate: SelectMonthDelegate?

    private let months: [Month]
    private let currentMonth: Month

    private lazy var monthPicker: MonthPicker = {
        let picker = MonthPicker(delegateAndDataSource: self, finishAction: weak(self) { $0.delegate?.didFinishSelection() })
        picker.selectMonth(monthNumber: self.currentMonth.position)
        return picker
    }()

    init(months: [Month], currentMonth: Month) {
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
        return months[row].name
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedMonth = months[row]
        delegate?.didSelectMonth(selectedMonth)
    }

}
