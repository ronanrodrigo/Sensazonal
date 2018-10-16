@testable import Sensazonal

public class FavoriteFoodStubGateway: FavoriteFoodsGateway {

    public var didCallFoods = false
    public var foodsStub: Result<[Food.Key]> = .failure(SensazonalError.unknown)

    public init() { }

    public func foods(onComplete: (Result<[Food.Key]>) -> Void) {
        didCallFoods = true
        onComplete(foodsStub)
    }
}
