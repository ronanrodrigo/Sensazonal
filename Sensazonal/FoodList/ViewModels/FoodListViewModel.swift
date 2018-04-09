import Foundation

struct FoodListViewModel {
    let foodsViewModel: [FoodViewModel]
    let month: GregorianMonth
    let monthNames = (0...11).map { DateFormatter().monthSymbols[$0].capitalized }
}

extension FoodListViewModel {
    init() {
        foodsViewModel = []
        month = GregorianMonth()
    }
}
