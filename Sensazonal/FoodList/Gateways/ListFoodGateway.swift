protocol ListFoodGateway {

    func foods(byMonth month: Int, onComplete: @escaping (Result<[Food]>) -> Void)

}
