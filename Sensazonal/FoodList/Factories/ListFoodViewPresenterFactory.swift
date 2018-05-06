struct ListFoodViewPresenterFactory {

    private init() { }

    static func make(binder: FoodListBinder) -> ListFoodPresenter {
        return ListFoodViewPresenter(binder: binder)
    }

}
