import Foundation

struct FoodListViewModel {
    let foodsViewModel: [FoodViewModel]
    let monthSelected: String
    let monthNumber: Int
    let monthNames = (0...11).map { DateFormatter().monthSymbols[$0].capitalized }
}

extension FoodListViewModel {
    init() {
        foodsViewModel = []
        monthSelected = ""
        monthNumber = 0
    }
}
