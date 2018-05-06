@testable import Sensazonal

final class StubFoodListControllerDelegate: FoodListControllerDelegate {

    var didOpenMonthSelector = false

    func openMonthSelector(at month: Month) {
        didOpenMonthSelector = true
    }

    func closeMonthSelector() { }

    func updateList(with month: Month) { }

}
