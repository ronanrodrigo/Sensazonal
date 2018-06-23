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
        self.favoritateGateway.favorite(shouldFavorite: !isFavorited, foodKeyName: keyName) {
            $0.onSuccess(self.handleFavoritate(!isFavorited))
            $0.onFailure(self.presenter.presentError)
        }
    }

    private func handleFavoritate(_ isFavorited: Bool) -> (KeyName) -> Void {
        return { keyName in
            if isFavorited { return self.presenter.favorited(keyName: keyName) }
            self.presenter.unfavorited(keyName: keyName)
        }
    }

}
