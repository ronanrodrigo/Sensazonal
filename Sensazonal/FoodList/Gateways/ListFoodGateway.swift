protocol ListFoodGateway {

    init(isFavoriteFoodGateway: IsFavoriteFoodGateway)
    func foods(byMonth month: Int, onComplete: @escaping (Result<[Food]>) -> Void)

}
