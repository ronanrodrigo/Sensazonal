@testable import Sensazonal

public final class ListFoodStubGateway: ListFoodGateway {

    public var stubResult = Result<[Food]>.failure(.unknown)

    public init() { }

    public func foods(byMonth month: Int, onComplete: @escaping (Result<[Food]>) -> Void) {
        onComplete(stubResult)
    }

}
