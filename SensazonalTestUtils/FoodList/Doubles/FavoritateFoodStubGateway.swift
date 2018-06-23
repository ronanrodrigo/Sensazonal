@testable import Sensazonal

public class FavoritateFoodStubGateway: FavoritateFoodGateway {

    public var didFavoriteFood = false
    public var didFavoriteFoodKeyName: String?
    public var resultStub: Result<KeyName> = Result.failure(.unknown)

    public init() { }

    public func favorite(shouldFavorite: Bool, foodKeyName: KeyName, onComplete: (Result<KeyName>) -> Void) {
        didFavoriteFood = shouldFavorite
        didFavoriteFoodKeyName = foodKeyName
        onComplete(resultStub)
    }

}
