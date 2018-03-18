import UIKit

final class ListFoodViewPresenter: ListFoodPresenter {

    private let binder: FoodListBinder

    init(binder: FoodListBinder) {
        self.binder = binder
    }

    func presentError(_ error: SensazonalError) { }

    func presentFoods(_ foods: [Food]) {
        let foodViewModels = foods.map { food -> FoodViewModel in
            return FoodViewModel(name: food.keyName, nameColor: .red, nameBackgroundColor: .white, photo: #imageLiteral(resourceName: "Strawberry"))
        }
        let foodListViewModel = FoodListViewModel(foodsViewModel: foodViewModels)
        binder.bind(viewModel: foodListViewModel)
    }

}
