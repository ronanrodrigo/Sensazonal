import UIKit

final class SelectMonthViewController: UIViewController {

    weak var delegate: FoodListControllerDelegate!
    private let interactiveTransition: InteractiveTransition
    private let transition: FadeAndAppearTransitioningDelegate
    private var viewModel = SelectMonthViewModelFactory.make()
    private var viewControllerTransition: SelectMonthTransition!

    private lazy var monthPicker = MonthSelectorViewFactory.make(dataProvider: self) { [weak self] in
        self?.delegate?.closeMonthSelector()
    }

    init(interactiveTransition: InteractiveTransition, transition: FadeAndAppearTransitioningDelegate) {
        self.interactiveTransition = interactiveTransition
        self.transition = transition
        super.init(nibName: nil, bundle: nil)
        view.addSubview(monthPicker)
        transitioningDelegate = transition
    }

    required init?(coder aDecoder: NSCoder) { Logger.shared.notImplemented(); return nil }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewControllerTransition = SelectMonthTransitionFactory.make(viewController: self, interactiveTransition: interactiveTransition)
        view.addGestureRecognizer(viewControllerTransition.closeMonthSelectorPanGesture)
        view.addGestureRecognizer(viewControllerTransition.closeMonthSelectorTapGesture)
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
