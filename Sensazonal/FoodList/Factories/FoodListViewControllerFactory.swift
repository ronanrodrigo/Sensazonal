struct FoodListViewControllerFactory {

    private init() { }

    static func make() -> FoodListViewController {
        return FoodListViewController()
    }

}
