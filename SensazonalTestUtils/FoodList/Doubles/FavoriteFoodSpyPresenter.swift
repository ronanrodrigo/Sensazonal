@testable import Sensazonal

public class FavoriteFoodSpyPresenter: FavoriteFoodPresenter {

    public var didPresentFavoritedWith: Food.Key?
    public var didPresentUnfavoritedWith: Food.Key?
    public var didPresentError = false

    public init() { }

    public func favorited(foodKey: Food.Key) {
        didPresentFavoritedWith = foodKey
    }

    public func unfavorited(foodKey: Food.Key) {
        didPresentUnfavoritedWith = foodKey
    }

    public func presentError(error: SensazonalError) {
        didPresentError = true
    }
}
