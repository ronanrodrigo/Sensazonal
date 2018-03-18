struct FoodListCollectionViewControllerFactory {

    static func make() -> FoodListCollectionViewController {
        let controller = FoodListControllerFactory.make()
        return controller.viewController
    }

}
