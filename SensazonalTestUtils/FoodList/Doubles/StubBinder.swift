@testable import Sensazonal

public final class StubBinder: FoodListBinder {

    public var didCallBinder = false
    public var viewModel: FoodListViewModel?

    public init() { }

    public func bind(viewModel: FoodListViewModel) {
        didCallBinder = true
        self.viewModel = viewModel
    }

}
