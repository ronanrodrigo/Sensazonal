class ListFoodByMonthInteractor {

    private let gateway: ListFoodGateway
    private let presenter: ListFoodPresenter

    init(gateway: ListFoodGateway, presenter: ListFoodPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }

    func list(byMonth month: Int) {
        guard GregorianMonth.isValid(month: month) else {
            return presenter.presentError(.invalidMonth)
        }

        gateway.filter(byMonth: month) { [weak self] in
            guard let this = self else { return }
            $0.onSuccess(this.presentFoods(monthNumber: month))
            $0.onFailure(this.presenter.presentError)
        }
    }

    private func presentFoods(monthNumber: Int) -> ([Food]) -> Void {
        return { foods in self.presenter.presentFoods(foods, monthNumber: monthNumber) }
    }

}
