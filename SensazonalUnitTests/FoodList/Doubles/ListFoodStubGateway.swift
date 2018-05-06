@testable import Sensazonal

final class ListFoodStubGateway: ListFoodGateway {

    func filter(byMonth month: Int, onComplete: (Result<[Food]>) -> Void) {
        onComplete(.failure(SensazonalError.unknown))
    }

}
