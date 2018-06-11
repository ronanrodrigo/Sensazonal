@testable import Sensazonal

public class FavoriteFoodStubGateway: FavoriteFoodsGateway {

    public var didCallFoods = false
    public var foodsStub: Result<[KeyName]> = .failure(SensazonalError.unknown)

    public init() { }

    public func foods(onComplete: (Result<[KeyName]>) -> Void) {
        didCallFoods = true
        onComplete(foodsStub)
    }
}
