@testable import Sensazonal

public final class FakeFoodListBinder: FoodListBinder {
    public var viewModel = FoodListViewModel()

    public init() { }

    public func bind(viewModel: FoodListViewModel) {
        self.viewModel = viewModel
    }
}
