@testable import Sensazonal

class ListFoodStubPresenter: ListFoodPresenter {

    var listedFoods: [Food] = []
    var didPresentFoodsStub = false
    var presentedError: SensazonalError!

    func presentFoods(_ foods: [Food], monthNumber: Int) {
        listedFoods = foods
        didPresentFoodsStub = true
    }

    func presentError(_ error: SensazonalError) {
        presentedError = error
    }

}