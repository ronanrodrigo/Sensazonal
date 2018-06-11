protocol FavoriteFoodPresenter {

    func favorited(food: Food)
    func unfavorited(food: Food)
    func presentError(error: SensazonalError)

}
