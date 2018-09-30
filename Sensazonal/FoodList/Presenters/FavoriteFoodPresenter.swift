protocol FavoriteFoodPresenter {

    func favorited(keyName: KeyName)
    func unfavorited(keyName: KeyName)
    func presentError(error: SensazonalError)

}
