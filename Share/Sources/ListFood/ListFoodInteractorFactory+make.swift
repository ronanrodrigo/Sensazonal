import Core

public extension ListFoodInteractorFactory {

    static func make(presenter: ListFoodPresenter) -> ListFoodInteractable {
        make(presenter: presenter, gateway: ListFoodGatewayFactory.make())
    }

}
