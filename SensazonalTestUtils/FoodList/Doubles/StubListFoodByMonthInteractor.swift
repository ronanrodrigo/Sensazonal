@testable import Sensazonal

public final class StubListFoodByMonthInteractor: ListFoodByMonthInteractor {

    public var didCallList = false
    public var didCallListWithMonth: Int?

    public override init(gateway: ListFoodGateway, presenter: ListFoodPresenter) {
        super.init(gateway: gateway, presenter: presenter)
    }

    public override func list(byMonth month: Int) {
        didCallList = true
        didCallListWithMonth = month
    }

}
