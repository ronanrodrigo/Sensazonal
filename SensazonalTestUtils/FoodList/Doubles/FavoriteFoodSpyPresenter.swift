@testable import Sensazonal

public class FavoriteFoodSpyPresenter: FavoriteFoodPresenter {

    public var didPresentFavoritedWith: KeyName?
    public var didPresentUnfavoritedWith: KeyName?
    public var didPresentError = false

    public init() { }

    public func favorited(keyName: KeyName) {
        didPresentFavoritedWith = keyName
    }

    public func unfavorited(keyName: KeyName) {
        didPresentUnfavoritedWith = keyName
    }

    public func presentError(error: SensazonalError) {
        didPresentError = true
    }
}
