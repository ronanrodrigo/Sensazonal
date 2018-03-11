class ListFoodMemoryGateway: ListFoodGatewable {

    func filter(byMonth month: Int, onComplete: (Result<[Food]>) -> Void) {
        let foods = DataSource.allFoods.filter { $0.months.contains(month) }
        onComplete(.success(foods))
    }

}
