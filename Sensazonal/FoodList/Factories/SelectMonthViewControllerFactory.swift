import UIKit

struct SelectMonthViewControllerFactory {

    static func make(delegate: SelectMonthDelegate) -> UIViewController {
        let months = MonthFactory.type.allMonths
        let viewController = SelectMonthPickerViewController(months: months, currentMonth: MonthFactory.make())
        viewController.delegate = delegate
        return viewController
    }

}
