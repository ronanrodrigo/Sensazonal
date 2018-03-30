struct ListFoodViewPresenterFactory {

    static func make(binder: FoodListBinder) -> ListFoodPresenter {
        return ListFoodViewPresenter(binder: binder)
    }

}
