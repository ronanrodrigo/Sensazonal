@testable import Sensazonal

public class FavoritateFoodStubGateway: FavoritateFoodGateway {

    public var didFavoriteFood = false
    public var didFavoriteFoodKeyName: String?
    public var resultStub: Result<KeyName> = Result.failure(.unknown)

    public init() { }

    public func favorite(foodKeyName: KeyName, onComplete: (Result<KeyName>) -> Void) {
        didFavoriteFood = true
        didFavoriteFoodKeyName = foodKeyName
        onComplete(resultStub)
    }

    public func unfavorite(foodKeyName: KeyName, onComplete: (Result<KeyName>) -> Void) {
        didFavoriteFood = false
        didFavoriteFoodKeyName = foodKeyName
        onComplete(resultStub)
    }

}
