import UIKit

final class SelectMonthViewController: UIViewController {

    private var viewModel = SelectMonthViewModelFactory.make()
    var interactor: InteractiveTransition!
    weak var delegate: FoodListControllerDelegate?

    private lazy var monthPicker = MonthSelectorViewFactory.make(dataProvider: self) { [weak self] in
        self?.delegate?.closeMonthSelector()
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        view.addSubview(monthPicker)
        let openMonthSelectorGesture = UIPanGestureRecognizer(target: self, action: #selector(openMonthSelectorWithGesture))
        view.addGestureRecognizer(openMonthSelectorGesture)
    }

    required init?(coder aDecoder: NSCoder) { Logger.shared.notImplemented(); return nil }

    @objc private func openMonthSelectorWithGesture(_ gesture: UIPanGestureRecognizer) {
        guard let view = gesture.view?.superview else { return }
        let point = view.convert(gesture.translation(in: view), to: view)
        var progress = (point.y / UIScreen.main.bounds.size.height) * 0.6
        progress = max(progress, 0)

        switch gesture.state {
        case .began:
            interactor.hasStarted = true
            delegate?.closeMonthSelector()
        case .changed:
            interactor.shouldFinish = gesture.translation(in: view).y > 50
            interactor.update(progress)
        case .cancelled:
            interactor.hasStarted = false
            interactor.completionSpeed = 1
            interactor.cancel()
        case .ended:
            interactor.hasStarted = false
            interactor.completionSpeed = 1 - progress
            endTransition(interactor.shouldFinish)
        default: break
        }
    }

    private func endTransition(_ shouldFinish: Bool) {
        if shouldFinish {
            interactor.finish()
        } else {
            interactor.cancel()
        }
    }
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
