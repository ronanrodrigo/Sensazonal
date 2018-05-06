import Foundation

struct FoodListViewModel {

    let foodsViewModel: [FoodViewModel]
    let month: Month

}

extension FoodListViewModel {

    init() {
        foodsViewModel = []
        month = MonthFactory.make()
    }

}
