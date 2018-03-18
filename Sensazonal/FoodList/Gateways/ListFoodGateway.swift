protocol ListFoodGateway {
    func filter(byMonth month: Int, onComplete: (Result<[Food]>) -> Void)
}
