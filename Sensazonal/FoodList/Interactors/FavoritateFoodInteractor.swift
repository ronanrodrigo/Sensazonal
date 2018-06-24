final class FavoritateFoodInteractor {

    private let favoritateGateway: FavoritateFoodGateway
    private let favoriteFoodsGateway: FavoriteFoodsGateway
    private let presenter: FavoriteFoodPresenter

    init(favoritateGateway: FavoritateFoodGateway, favoriteFoodsGateway: FavoriteFoodsGateway, presenter: FavoriteFoodPresenter) {
        self.favoritateGateway = favoritateGateway
        self.favoriteFoodsGateway = favoriteFoodsGateway
        self.presenter = presenter
    }

    func favorite(keyName: KeyName) {
        favoriteFoodsGateway.foods {
            $0.onSuccess { self.handleFavoriteFoods(keyName: keyName, favoriteKeyNames: $0) }
            $0.onFailure(self.presenter.presentError)
        }
    }

    private func handleFavoriteFoods(keyName: KeyName, favoriteKeyNames: [KeyName]) {
        let isFavorited = favoriteKeyNames.contains(keyName)
        if isFavorited {
            self.favoritateGateway.unfavorite(foodKeyName: keyName) {
                $0.onSuccess(self.presenter.unfavorited)
                $0.onFailure(self.presenter.presentError)
            }
        } else {
            self.favoritateGateway.favorite(foodKeyName: keyName) {
                $0.onSuccess(self.presenter.favorited)
                $0.onFailure(self.presenter.presentError)
            }
        }
    }

}
