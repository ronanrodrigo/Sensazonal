@testable import Sensazonal

final class StubFoodListControllerDelegate: FoodListControllerDelegate {

    var didOpenMonthSelector = false
    var didUpdateList = false
    var didUpdateListWith: Month?

    func openMonthSelector(at month: Month) {
        didOpenMonthSelector = true
    }

    func closeMonthSelector() { }

    func updateList(with month: Month) {
        didUpdateList = true
        didUpdateListWith = month
    }

}
