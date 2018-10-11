import Foundation
@testable import Sensazonal

public final class StubFoodListDataProvider: FoodListDataProvider {

    private let total: Int

    public init(total: Int = 0) {
        self.total = total
    }

    public func foodsQuantity(at section: Int) -> Int {
        return total
    }

    public func food(at indexPath: IndexPath) -> FoodViewModel {
        return FoodViewModel.sample
    }

    public func groupsQuantity() -> Int {
        return 1
    }

    public func group(at section: Int) -> FoodGroupViewModel {
        return FoodGroupViewModel.sample
    }

    public func favoritateFood(foodKey: Food.Key) { }

}
