@testable import Sensazonal

public final class StubFoodListControllerDelegate: FoodListControllerDelegate {

    public var didOpenMonthSelector = false
    public var didUpdateList = false
    public var didCloseMonthSelector = false
    public var didUpdateListWith: Month?
    public var didFavoritate = false
    public var didFavoritateWith: String?

    public init() { }

    public func openMonthSelector(at month: Month) {
        didOpenMonthSelector = true
    }

    public func closeMonthSelector() {
        didCloseMonthSelector = true
    }

    public func updateList(with month: Month) {
        didUpdateList = true
        didUpdateListWith = month
    }

    public func favoritate(foodKeyName: String) {
        didFavoritate = true
        didFavoritateWith = foodKeyName
    }

}
