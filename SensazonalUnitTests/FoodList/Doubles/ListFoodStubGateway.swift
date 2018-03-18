@testable import Sensazonal

class ListFoodStubGateway: ListFoodGateway {

    func filter(byMonth month: Int, onComplete: (Result<[Food]>) -> Void) {
        onComplete(.failure(SensazonalError.unknown))
    }

}
