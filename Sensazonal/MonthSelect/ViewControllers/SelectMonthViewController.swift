import UIKit

final class SelectMonthViewController: UIViewController {

    private var viewModel = SelectMonthViewModelFactory.make()
    weak var delegate: FoodListControllerDelegate?

    private lazy var monthPicker = MonthSelectorViewFactory.make(dataProvider: self) { [weak self] in
        self?.delegate?.closeMonthSelector()
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
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
        delegate?.updateList(with: month)
    }

}
