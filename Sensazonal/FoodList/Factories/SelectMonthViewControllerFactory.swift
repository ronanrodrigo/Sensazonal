import UIKit

struct SelectMonthViewControllerFactory {

    static func make(_ months: [String], _ currentMonth: Month) -> UIViewController {
        return SelectMonthPickerViewController(months: months, currentMonth: currentMonth)
    }

}
