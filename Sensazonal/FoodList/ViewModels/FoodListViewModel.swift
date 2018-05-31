import Foundation

struct FoodListViewModel {

    let foodsViewModel: [String: [FoodViewModel]]
    let month: Month

}

extension FoodListViewModel {

    init() {
        foodsViewModel = [:]
        month = MonthFactory.make()
    }

}
