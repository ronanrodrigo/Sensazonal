@testable import Sensazonal

class ListFoodStubPresenter: ListFoodPresenter {

    var listedFoods: [Food] = []
    var didPresentFoodsStub = false
    var presentedError: SensazonalError!
    var presentedMonthNumber: Int?

    func presentFoods(_ foods: [Food], monthNumber: Int) {
        listedFoods = foods
        didPresentFoodsStub = true
        presentedMonthNumber = monthNumber
    }

    func presentError(_ error: SensazonalError) {
        presentedError = error
    }

}
