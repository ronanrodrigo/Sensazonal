struct ListFoodByMonthInteractorFactory {

    static func make(presenter: ListFoodPresenter) -> ListFoodByMonthInteractor {
        return ListFoodByMonthInteractor(gateway: ListFoodGatewayFactory.make(), presenter: presenter)
    }

}
