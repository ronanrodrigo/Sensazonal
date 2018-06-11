protocol FavoriteFoodsGateway {

    func foods(onComplete: (Result<[KeyName]>) -> Void)

}
