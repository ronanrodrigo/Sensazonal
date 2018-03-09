class ListFoodByMonthInteractor {

    private let gateway: ListFoodGatewable
    private let presenter: ListFoodPresentable

    init(gateway: ListFoodGatewable, presenter: ListFoodPresentable) {
        self.gateway = gateway
        self.presenter = presenter
    }

    func list(byMonth month: Int) {
        let isValidMonth = (1...12) ~= month
        guard isValidMonth else {
            return presenter.presentError(.invalidMonth)
        }

        gateway.filter(byMonth: month, onComplete: { result in
            result.handle(presenter.presentFoods, presenter.presentError)
        })
    }

}
