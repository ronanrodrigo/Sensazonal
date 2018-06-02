import Foundation

struct FoodListViewModel {

    let foodsViewModel: [FoodGroupViewModel: [FoodViewModel]]
    let month: Month

    func groups() -> [FoodGroupViewModel] {
        return Array(foodsViewModel.keys)
    }

    func foods(at group: FoodGroupViewModel) -> [FoodViewModel] {
        return foodsViewModel[group] ?? []
    }

}

extension FoodListViewModel {

    init() {
        foodsViewModel = [:]
        month = MonthFactory.make()
    }

}
