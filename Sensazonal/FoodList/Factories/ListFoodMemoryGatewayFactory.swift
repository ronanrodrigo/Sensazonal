struct ListFoodMemoryGatewayFactory {

    private init() { }

    static func make() -> ListFoodGateway {
        return ListFoodMemoryGateway()
    }

}
