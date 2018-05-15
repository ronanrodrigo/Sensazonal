import UIKit

final class SelectMonthViewController: UIViewController {

    weak var interactiveTransition: InteractiveTransition!
    weak var delegate: FoodListControllerDelegate!
    private var viewModel = SelectMonthViewModelFactory.make()

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
        guard let viewWithGesture = gesture.view?.superview else { return }
        let point = viewWithGesture.convert(gesture.translation(in: viewWithGesture), to: viewWithGesture)
        let progress = max(point.y / view.bounds.size.height, 0)
        let percentThreshold: CGFloat = 0.2
        let veolcity = gesture.velocity(in: viewWithGesture).y

        switch gesture.state {
        case .began:
            interactiveTransition.hasStarted = true
            delegate?.closeMonthSelector()
        case .changed:
            interactiveTransition.shouldFinish = progress > percentThreshold || veolcity > 800
            interactiveTransition.update(progress)
        case .cancelled:
            interactiveTransition.hasStarted = false
            interactiveTransition.completionSpeed = 1
            interactiveTransition.cancel()
        case .ended:
            interactiveTransition.hasStarted = false
            interactiveTransition.completionSpeed = 1 - progress
            interactiveTransition.endTransition()
        default: break
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
