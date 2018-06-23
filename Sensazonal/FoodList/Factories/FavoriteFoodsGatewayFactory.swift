struct FavoriteFoodsGatewayFactory {

    static func make() -> FavoriteFoodsGateway {
        return FavoriteFoodUserDefaultsGateway()
    }

}
