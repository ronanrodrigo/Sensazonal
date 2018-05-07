@testable import Sensazonal

public final class StubFoodListDataProvider: FoodListDataProvider {

    private let total: Int

    public init(total: Int = 0) {
        self.total = total
    }

    public func food(at position: Int) -> FoodViewModel {
        return FoodViewModel.sample
    }

    public func foodsTotal() -> Int {
        return total
    }

}
