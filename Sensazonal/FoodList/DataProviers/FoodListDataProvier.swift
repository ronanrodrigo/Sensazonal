protocol FoodListDataProvider {
    func foodsTotal() -> Int
    func food(at position: Int) -> FoodViewModel
}
