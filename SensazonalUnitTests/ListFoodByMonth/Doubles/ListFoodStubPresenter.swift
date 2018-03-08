@testable import Sensazonal

class ListFoodStubPresenter: ListFoodPresentable {

    var listedFoods: [Food] = []
    var didPresentFoodsStub = false
    var presentedError: SensazonalError!

    func present(foods: [Food]) {
        listedFoods = foods
        didPresentFoodsStub = true
    }

    func present(error: SensazonalError) {
        presentedError = error
    }

}
