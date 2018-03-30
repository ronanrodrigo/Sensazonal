struct FoodListViewModel {
    let foodsViewModel: [FoodViewModel]
    let monthSelected: String
}

extension FoodListViewModel {
    init() {
        foodsViewModel = []
        monthSelected = ""
    }
}
