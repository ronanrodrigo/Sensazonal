protocol ListFoodGateway {

    func foods(byMonth month: Int, onComplete: (Result<[Food]>) -> Void)

}
