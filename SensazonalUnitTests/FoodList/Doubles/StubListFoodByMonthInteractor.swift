@testable import Sensazonal

final class StubListFoodByMonthInteractor: ListFoodByMonthInteractor {

    var didCallList = false
    var didCallListWithMonth: Int?

    override func list(byMonth month: Int) {
        didCallList = true
        didCallListWithMonth = month
    }

}
