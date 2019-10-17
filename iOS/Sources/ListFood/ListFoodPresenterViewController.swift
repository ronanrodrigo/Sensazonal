import Core
import UIKit

final class ListFoodPresenterViewController: ListFoodPresenter {

    weak var bindable: ListFoodTableViewControllerBind?
    private let colors: [UIColor] = [.systemGreen, .systemRed, .systemBlue, .systemPink,
                                     .systemTeal, .systemOrange, .systemPurple, .systemYellow]

    func present(groupedFoods: [GroupedFoods], month: Month) {
        let groupedFoodViewModels = groupedFoods.map { group -> GroupedFoodViewModel in
            let foodNames = group.foods.map { FoodViewModel(uuid: $0.uuid, name: $0.name, color: self.randomColor()) }
            return .init(uuid: group.uuid, group: group.name, foods: foodNames)
        }
        let title = localize("month_foods", with: month.name)
        let viewModel = ListFoodViewModel(title: title, groupedFoodViewModels: groupedFoodViewModels)
        bindable?.bind(viewModel: viewModel)
    }

    func present(error: ListFoodError) {
        let viewModel = ListFoodErrorViewModel(error)
        bindable?.bind(errorViewModel: viewModel)
    }

    private func randomColor() -> UIColor? {
        return colors.randomElement()
    }

}

private extension ListFoodErrorViewModel {
    private static var internalError = ListFoodErrorViewModel(title: localize("internal_error"), message: localize("this_should_not_happen"))
    private static var invalidMonth = ListFoodErrorViewModel(title: localize("invalid_month"), message: localize("select_another_month"))
    private static var notFound = ListFoodErrorViewModel(title: localize("source_not_found"), message: localize("this_should_not_happen"))

    init(_ error: ListFoodError) {
        switch error {
        case .invalid: self = .internalError
        case .invalidMonth: self = .invalidMonth
        case .notFound: self = .notFound
        }
    }
}
