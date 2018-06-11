@testable import Sensazonal

public class FavoriteFoodSpyPresenter: FavoriteFoodPresenter {

    public var didPresentFavoritedWith: Food?
    public var didPresentUnfavoritedWith: Food?
    public var didPresentError = false

    public init() { }

    public func favorited(food: Food) {
        didPresentFavoritedWith = food
    }

    public func unfavorited(food: Food) {
        didPresentUnfavoritedWith = food
    }

    public func presentError(error: SensazonalError) {
        didPresentError = true
    }
}
