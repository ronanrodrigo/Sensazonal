struct IsFavoriteFoodGatewayFactory {

    static func make() -> IsFavoriteFoodGateway {
        return IsFavoriteFoodUserDefaultsGateway()
    }

}
