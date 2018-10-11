final class FavoritateFoodInteractor {

    private let favoritateGateway: FavoritateFoodGateway
    private let favoriteFoodsGateway: FavoriteFoodsGateway
    private let presenter: FavoriteFoodPresenter

    init(favoritateGateway: FavoritateFoodGateway, favoriteFoodsGateway: FavoriteFoodsGateway, presenter: FavoriteFoodPresenter) {
        self.favoritateGateway = favoritateGateway
        self.favoriteFoodsGateway = favoriteFoodsGateway
        self.presenter = presenter
    }

    func favorite(foodKey: Food.Key) {
        favoriteFoodsGateway.foods {
            $0.onSuccess { self.handleFavoriteFoods(foodKey: foodKey, favoriteKeys: $0) }
            $0.onFailure(self.presenter.presentError)
        }
    }

    private func handleFavoriteFoods(foodKey: Food.Key, favoriteKeys: [Food.Key]) {
        let isFavorited = favoriteKeys.contains(foodKey)
        let action = isFavorited ?
            (gateway: favoritateGateway.unfavorite, presenter: presenter.unfavorited) :
            (gateway: favoritateGateway.favorite, presenter: presenter.favorited)

        action.gateway(foodKey) {
            $0.onSuccess(action.presenter)
            $0.onFailure(self.presenter.presentError)
        }
    }

}
