import Foundation

struct FoodListViewModel {
    let foodsViewModel: [FoodViewModel]
    let month: Month
    let monthNames = MonthFactory.type.allMonths
}

extension FoodListViewModel {
    init() {
        foodsViewModel = []
        month = MonthFactory.make()
    }
}
