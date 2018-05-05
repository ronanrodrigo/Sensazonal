import UIKit

class SelectMonthViewController: UIViewController {

    private var viewModel = SelectMonthViewModelFactory.make()
    weak var delegate: SelectMonthDelegate?

    private lazy var monthPicker = MonthSelectorViewFactory.make(dataProvider: self, action: weak(self) {
        $0.delegate?.didFinishSelection()
    })

    init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overCurrentContext
        view.addSubview(monthPicker)
    }

    required init?(coder aDecoder: NSCoder) { Logger.shared.notImplemented(); return nil }

}

extension SelectMonthViewController: SelectMonthBinder {
    func bind(viewModel: SelectMonthViewModel) {
        self.viewModel = viewModel
        monthPicker.selectMonth(monthNumber: viewModel.currentMonth.position)
        monthPicker.reload()
    }
}

extension SelectMonthViewController: MonthSelectorDataProvider {

    func monthsTotal() -> Int {
        return viewModel.months.count
    }

    func monthName(in position: Int) -> String {
        return viewModel.monthNameAt(position)
    }

    func monthSelected(in position: Int) {
        let month = viewModel.months[position]
        delegate?.didSelectMonth(month)
    }

}
