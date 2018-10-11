protocol FavoriteFoodsGateway {

    func foods(onComplete: (Result<[Food.Key]>) -> Void)

}
