import Core

public extension ListFoodInteractorFactory {

    static func make(presenter: ListFoodPresenter) -> ListFoodInteractable {
        return make(presenter: presenter, gateway: ListFoodGatewayFactory.make())
    }

}
