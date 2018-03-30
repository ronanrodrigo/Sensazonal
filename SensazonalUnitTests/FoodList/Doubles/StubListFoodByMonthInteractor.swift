@testable import Sensazonal

class StubListFoodByMonthInteractor: ListFoodByMonthInteractor {
    var didCallList = false

    override func list(byMonth month: Int) {
        didCallList = true
    }
}
