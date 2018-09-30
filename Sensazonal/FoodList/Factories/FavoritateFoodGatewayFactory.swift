struct FavoritateFoodGatewayFactory {

    static func make() -> FavoritateFoodGateway {
        return FavoritateFoodUserDefaultsGateway()
    }

}
