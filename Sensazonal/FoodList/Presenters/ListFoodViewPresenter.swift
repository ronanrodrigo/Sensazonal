import UIKit

final class ListFoodViewPresenter: ListFoodPresenter {

    private weak var binder: FoodListBinder?

    init(binder: FoodListBinder) {
        self.binder = binder
    }

    func presentError(_ error: SensazonalError) { }

    func presentFoods(_ foods: [Food], monthNumber: Int) {
        let foodViewModels = foods.map { food -> FoodViewModel in
            return FoodViewModel(name: food.name, nameColor: .white, nameBackgroundColor: .red, photo: #imageLiteral(resourceName: "content/strawberry"))
        }

        do {
            let month = try MonthFactory.make(number: monthNumber)
            let foodListViewModel = FoodListViewModel(foodsViewModel: foodViewModels, month: month)
            binder?.bind(viewModel: foodListViewModel)
        } catch { presentError(.invalidMonth) }
    }

}

fileprivate extension Food {

    var name: String { return Locale.localize(keyName) }

}
