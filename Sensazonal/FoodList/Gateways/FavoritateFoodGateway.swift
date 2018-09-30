protocol FavoritateFoodGateway {

    func favorite(foodKeyName: KeyName, onComplete: (Result<KeyName>) -> Void)
    func unfavorite(foodKeyName: KeyName, onComplete: (Result<KeyName>) -> Void)

}
