import UIKit

final class MonthPicker: UIView {

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

    private let confirm: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Done", for: .normal)
        return button
    }()

    init(delegateAndDataSource: UIPickerViewDelegate & UIPickerViewDataSource) {
        super.init(frame: .zero)
        monthPicker.dataSource = delegateAndDataSource
        monthPicker.delegate = delegateAndDataSource
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.white.withAlphaComponent(0.95)
        alpha = 0
        installSubviews()
        installConstraints()
    }

    required init?(coder aDecoder: NSCoder) { Logger.shared.notImplemented(#file, #function, #line); return nil }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        guard let parentView = superview else { return }
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
            trailingAnchor.constraint(equalTo: parentView.trailingAnchor),
            bottomAnchor.constraint(equalTo: parentView.bottomAnchor)
        ])
    }

    private func installSubviews() {
        addSubview(navigation)
        addSubview(monthPicker)
        navigation.addSubview(confirm)
    }

    private func installConstraints() {
        installNavigationConstraints()
        installMonthPickerConstraints()
        installConfirmConstraints()
    }

    private func installNavigationConstraints() {
        NSLayoutConstraint.activate([
            navigation.leadingAnchor.constraint(equalTo: leadingAnchor),
            navigation.trailingAnchor.constraint(equalTo: trailingAnchor),
            navigation.bottomAnchor.constraint(equalTo: monthPicker.topAnchor)])
    }

    private func installMonthPickerConstraints() {
        NSLayoutConstraint.activate([
            monthPicker.leadingAnchor.constraint(equalTo: leadingAnchor),
            monthPicker.topAnchor.constraint(equalTo: topAnchor),
            monthPicker.trailingAnchor.constraint(equalTo: trailingAnchor),
            monthPicker.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)])
    }

    private func installConfirmConstraints() {
        NSLayoutConstraint.activate([
            confirm.topAnchor.constraint(equalTo: navigation.topAnchor, constant: Metric.small),
            confirm.trailingAnchor.constraint(equalTo: navigation.trailingAnchor, constant: -Metric.large),
            confirm.bottomAnchor.constraint(equalTo: navigation.bottomAnchor, constant: -Metric.small)])
    }

    func selectMonth(monthNumber: Int) {
        monthPicker.selectRow(monthNumber, inComponent: 0, animated: false)
    }

    func toggleVisibility() {
        let isHide = alpha == 0
        alpha = isHide ? 1 : 0
    }

}
