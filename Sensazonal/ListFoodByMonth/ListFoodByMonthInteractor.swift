class ListFoodByMonthInteractor {

    private let gateway: ListFoodGatewable
    private let presenter: ListFoodPresentable

    init(gateway: ListFoodGatewable, presenter: ListFoodPresentable) {
        self.gateway = gateway
        self.presenter = presenter
    }

    func list(byMonth month: Int) {
        if month < 1 || month > 12 {
            return presenter.present(error: .invalidMonth)
        }

        gateway.filter(byMonth: month, onComplete: handleResult)
    }

    private func handleResult(result: Result<[Food]>) {
        switch result {
        case let .success(foods):
            presenter.present(foods: foods)
        case let .failure(error):
            presenter.present(error: error)
        }
    }

}
