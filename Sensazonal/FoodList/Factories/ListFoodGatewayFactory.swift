struct ListFoodGatewayFactory {

    static func make() -> ListFoodGateway {
        return ListFoodJsonFileGateway()
    }

}
