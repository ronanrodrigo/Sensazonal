struct ListFoodMemoryGatewayFactory {

    static func make() -> ListFoodGateway {
        return ListFoodMemoryGateway()
    }

}
