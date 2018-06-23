protocol FavoritateFoodGateway {

    func favorite(shouldFavorite: Bool, foodKeyName: KeyName, onComplete: (Result<KeyName>) -> Void)

}
