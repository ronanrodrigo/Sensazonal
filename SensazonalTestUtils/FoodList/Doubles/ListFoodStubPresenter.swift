@testable import Sensazonal

public final class ListFoodStubPresenter: ListFoodPresenter {

    public var listedFoods: [Food] = []
    public var didPresentFoodsStub = false
    public var presentedError: SensazonalError!
    public var presentedMonthNumber: Int?

    public init() { }

    public func presentFoods(_ foods: [Food], monthNumber: Int) {
        listedFoods = foods
        didPresentFoodsStub = true
        presentedMonthNumber = monthNumber
    }

    public func presentError(_ error: SensazonalError) {
        presentedError = error
    }

}
