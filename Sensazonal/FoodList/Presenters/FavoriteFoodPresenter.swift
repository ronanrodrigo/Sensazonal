protocol FavoriteFoodPresenter {

    func favorited(foodKey: Food.Key)
    func unfavorited(foodKey: Food.Key)
    func presentError(error: SensazonalError)

}
