protocol FavoritateFoodGateway {

    func favorite(shouldFavorite: Bool, foodKeyName: KeyName, onComplete: (Result<Food>) -> Void)

}
