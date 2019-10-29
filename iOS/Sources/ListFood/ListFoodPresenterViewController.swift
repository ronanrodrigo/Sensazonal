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
        let title = localize("%@ foods", with: month.name)
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
    private static var internalError = ListFoodErrorViewModel(title: localize("Internal error"),
                                                              message: localize("This should not happen"))
    private static var invalidMonth = ListFoodErrorViewModel(title: localize("Invalid month"),
                                                             message: localize("Select another month"))
    private static var notFound = ListFoodErrorViewModel(title: localize("Source not found"),
                                                         message: localize("This should not happen"))

    init(_ error: ListFoodError) {
        switch error {
        case .invalid: self = .internalError
        case .invalidMonth: self = .invalidMonth
        case .notFound: self = .notFound
        }
    }
}
