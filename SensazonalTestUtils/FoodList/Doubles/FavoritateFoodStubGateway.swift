@testable import Sensazonal

public class FavoritateFoodStubGateway: FavoritateFoodGateway {

    public var didFavoriteFood = false
    public var didFavoriteFoodKey: Food.Key?
    public var resultStub: Result<Food.Key> = Result.failure(.unknown)

    public init() { }

    public func favorite(foodKey: Food.Key, onComplete: (Result<Food.Key>) -> Void) {
        didFavoriteFood = true
        didFavoriteFoodKey = foodKey
        onComplete(resultStub)
    }

    public func unfavorite(foodKey: Food.Key, onComplete: (Result<Food.Key>) -> Void) {
        didFavoriteFood = false
        didFavoriteFoodKey = foodKey
        onComplete(resultStub)
    }

}
