@testable import Sensazonal

public final class ListFoodStubGateway: ListFoodGateway {

    public var stubResult = Result<[Food]>.failure(.unknown)
    private let isFavoriteFoodGateway: IsFavoriteFoodGateway

    public init(isFavoriteFoodGateway: IsFavoriteFoodGateway) {
        self.isFavoriteFoodGateway = isFavoriteFoodGateway
    }

    public func foods(byMonth month: Int, onComplete: @escaping (Result<[Food]>) -> Void) {
        onComplete(stubResult)
    }

}
