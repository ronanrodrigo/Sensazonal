public enum ListFoodInteractorFactory {

    public static func make(presenter: ListFoodPresenter, gateway: ListFoodGateway) -> ListFoodInteractable {
        return ListFoodInteractor(gateway: gateway, presenter: presenter,
                                         monthGateway: MonthGatewayFactory.make())
    }

}
