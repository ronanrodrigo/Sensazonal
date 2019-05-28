import Core

public enum ListFoodGatewayFactory {

    static func make() -> ListFoodGateway {
        return ListFoodGatewayLocal()
    }

}
