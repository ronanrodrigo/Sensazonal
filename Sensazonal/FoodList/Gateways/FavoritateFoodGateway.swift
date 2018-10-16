protocol FavoritateFoodGateway {

    func favorite(foodKey: Food.Key, onComplete: (Result<Food.Key>) -> Void)
    func unfavorite(foodKey: Food.Key, onComplete: (Result<Food.Key>) -> Void)

}
