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
            $0.onSuccess(self.handleFavoritate)
            $0.onFailure(self.presenter.presentError)
        }
    }

    private func handleFavoritate(food: Food) {
        if food.favorited {
            self.presenter.favorited(food: food)
        } else {
            self.presenter.unfavorited(food: food)
        }
    }

}
