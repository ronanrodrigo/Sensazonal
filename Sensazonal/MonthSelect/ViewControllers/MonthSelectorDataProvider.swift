import UIKit

protocol MonthSelectorDataProvider: class {

    func monthsTotal() -> Int
    func monthName(in position: Int) -> String
    func monthSelected(in position: Int)

}
