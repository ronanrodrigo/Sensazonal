struct ListFoodByMonthInteractorFactory {

    private init() { }

    static func make(presenter: ListFoodPresenter) -> ListFoodByMonthInteractor {
        return ListFoodByMonthInteractor.init(gateway: ListFoodMemoryGatewayFactory.make(), presenter: presenter)
    }

}
