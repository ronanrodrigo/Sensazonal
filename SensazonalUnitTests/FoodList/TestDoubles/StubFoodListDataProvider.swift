@testable import Sensazonal

final class StubFoodListDataProvider: FoodListDataProvider {
    private let total: Int

    init(total: Int = 0) {
        self.total = total
    }

    func food(at position: Int) -> FoodViewModel {
        return FoodViewModel.sample
    }

    func foodsTotal() -> Int {
        return total
    }
}
