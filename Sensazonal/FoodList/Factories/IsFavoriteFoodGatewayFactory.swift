struct IsFavoriteFoodGatewayFactory {

    static func make() -> FavoriteFoodsGateway {
        return FavoriteFoodUserDefaultsGateway()
    }

}
