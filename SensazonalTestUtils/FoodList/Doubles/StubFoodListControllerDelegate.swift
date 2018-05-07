@testable import Sensazonal

public final class StubFoodListControllerDelegate: FoodListControllerDelegate {

    public var didOpenMonthSelector = false
    public var didUpdateList = false
    public var didUpdateListWith: Month?

    public init() { }

    public func openMonthSelector(at month: Month) {
        didOpenMonthSelector = true
    }

    public func closeMonthSelector() { }

    public func updateList(with month: Month) {
        didUpdateList = true
        didUpdateListWith = month
    }

}
