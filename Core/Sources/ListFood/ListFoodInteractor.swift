import Combine

public protocol ListFoodInteractable {
    func list()
    func list(forMonth month: Int)
}

final class ListFoodInteractor: ListFoodInteractable {

    private let gateway: ListFoodGateway
    private let presenter: ListFoodPresenter
    private let monthGateway: MonthGateway
    private var disposables = Set<AnyCancellable>()

    init(gateway: ListFoodGateway, presenter: ListFoodPresenter, monthGateway: MonthGateway) {
        self.gateway = gateway
        self.presenter = presenter
        self.monthGateway = monthGateway
    }

    public func list() {
        list(forMonth: monthGateway.current().number)
    }

    public func list(forMonth monthNumber: Int) {
        let month: Month
        do {
            month = try monthGateway.month(number: monthNumber)
        } catch { return presenter.present(error: .invalidMonth) }

        gateway
            .all(byMonth: month)
            .sink(receiveCompletion: { [weak self] in
                if case .failure = $0 { self?.presenter.present(error: .notFound) }
            }) { [weak self] in
                self?.presenter.present(groupedFoods: $0, month: month)
        }
        .store(in: &disposables)
    }

}
