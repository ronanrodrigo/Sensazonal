import Foundation

struct FoodListViewModel {
    let foodsViewModel: [FoodViewModel]
    let month: GregorianMonth
    let monthNames = GregorianMonth.allMonths
}

extension FoodListViewModel {
    init() {
        foodsViewModel = []
        month = GregorianMonth()
    }
}
