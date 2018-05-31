import UIKit

final class ListFoodViewPresenter: ListFoodPresenter {

    private weak var binder: FoodListBinder?

    init(binder: FoodListBinder) {
        self.binder = binder
    }

    func presentError(_ error: SensazonalError) { }

    func presentFoods(_ foods: [Food], monthNumber: Int) {
        do {
            let month = try MonthFactory.make(number: monthNumber)
            let groupedFoods = Dictionary(grouping: foods) { $0.keyGroup }
            let foodViewModels = groupedFoods.mapValues { foods -> [FoodViewModel] in
                return foods.map { FoodViewModel(name: $0.name, photo: $0.image) }
            }
            let foodListViewModel = FoodListViewModel(foodsViewModel: foodViewModels, month: month)
            binder?.bind(viewModel: foodListViewModel)
        } catch { presentError(.invalidMonth) }
    }

}

fileprivate extension Food {

    var name: String { return Locale.localize(keyName) }
    var image: UIImage { return UIImage(named: imageName) ?? #imageLiteral(resourceName: "Content/BLANK") }
    private var imageName: String { return "Content/\(keyName)" }

}
