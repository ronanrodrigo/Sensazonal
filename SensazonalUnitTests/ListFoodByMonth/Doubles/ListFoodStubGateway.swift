@testable import Sensazonal

class ListFoodStubGateway: ListFoodGatewable {

    func filter(byMonth month: Int, onComplete: (Result<[Food]>) -> Void) {
        onComplete(.failure(SensazonalError.unknown))
    }

}
