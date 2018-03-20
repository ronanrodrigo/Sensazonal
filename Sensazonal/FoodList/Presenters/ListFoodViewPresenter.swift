import UIKit

final class ListFoodViewPresenter: ListFoodPresenter {

    private let binder: FoodListBinder

    init(binder: FoodListBinder) {
        self.binder = binder
    }

    func presentError(_ error: SensazonalError) { }

    func presentFoods(_ foods: [Food]) {
        let foodViewModels = foods.map { food -> FoodViewModel in
            let name = Locale.localize(food.keyName)
            return FoodViewModel(name: name, nameColor: .white, nameBackgroundColor: .red, photo: #imageLiteral(resourceName: "Strawberry"))
        }
        let foodListViewModel = FoodListViewModel(foodsViewModel: foodViewModels)
        binder.bind(viewModel: foodListViewModel)
    }

}
