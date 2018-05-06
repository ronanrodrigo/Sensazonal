import UIKit

typealias MonthSelectorView = UIView & MonthSelectable & Reloadable

final class MonthPicker: MonthSelectorView {

    private let finishAction: () -> Void

    private let monthPicker: UIPickerView = {
        let picker = UIPickerView(frame: .zero)
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()

    private let navigation: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white.withAlphaComponent(0.97)
        return view
    }()

    private let finish: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Done", for: .normal)
        button.addTarget(self, action: #selector(finishSelection), for: .touchUpInside)
        return button
    }()

    private var delegateDataSource: MonthPickerDelegateDataSource

    init(dataProvider: MonthSelectorDataProvider, finishAction: @escaping () -> Void) {
        self.finishAction = finishAction
        delegateDataSource = MonthPickerDelegateDataSourceFactory.make(dataProvider: dataProvider)
        super.init(frame: .zero)
        monthPicker.dataSource = delegateDataSource
        monthPicker.delegate = delegateDataSource
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.white.withAlphaComponent(0.95)
        installSubviews()
        installConstraints()
    }

    required init?(coder aDecoder: NSCoder) { Logger.shared.notImplemented(); return nil }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if let parentView = superview {
            NSLayoutConstraint.activate([
                leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
                trailingAnchor.constraint(equalTo: parentView.trailingAnchor),
                bottomAnchor.constraint(equalTo: parentView.bottomAnchor)
            ])
        }
    }

    private func installSubviews() {
        addSubview(monthPicker)
        addSubview(navigation)
        navigation.addSubview(finish)
    }

    private func installConstraints() {
        installNavigationConstraints()
        installMonthPickerConstraints()
        installConfirmConstraints()
    }

    private func installNavigationConstraints() {
        NSLayoutConstraint.activate([
            navigation.topAnchor.constraint(equalTo: topAnchor),
            navigation.leadingAnchor.constraint(equalTo: leadingAnchor),
            navigation.trailingAnchor.constraint(equalTo: trailingAnchor),
            navigation.bottomAnchor.constraint(equalTo: monthPicker.topAnchor)])
    }

    private func installMonthPickerConstraints() {
        NSLayoutConstraint.activate([
            monthPicker.leadingAnchor.constraint(equalTo: leadingAnchor),
            monthPicker.trailingAnchor.constraint(equalTo: trailingAnchor),
            monthPicker.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)])
    }

    private func installConfirmConstraints() {
        NSLayoutConstraint.activate([
            finish.topAnchor.constraint(equalTo: navigation.topAnchor, constant: Metric.small),
            finish.trailingAnchor.constraint(equalTo: navigation.trailingAnchor, constant: -Metric.large),
            finish.bottomAnchor.constraint(equalTo: navigation.bottomAnchor, constant: -Metric.small)])
    }

    @objc private func finishSelection() {
        finishAction()
    }

    func selectMonth(monthNumber: Int) {
        monthPicker.selectRow(monthNumber, inComponent: 0, animated: false)
    }

    func reload() {
        monthPicker.reloadAllComponents()
    }

}
