struct FavoritateFoodInteractorFactory {

    static func make(presenter: FavoriteFoodPresenter) -> FavoritateFoodInteractor {
        return FavoritateFoodInteractor(favoritateGateway: FavoritateFoodGatewayFactory.make(),
                                        favoriteFoodsGateway: FavoriteFoodsGatewayFactory.make(),
                                        presenter: presenter)
    }

}
