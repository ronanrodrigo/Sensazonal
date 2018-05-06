protocol ListFoodPresenter {

    func presentFoods(_ foods: [Food], monthNumber: Int)
    func presentError(_ error: SensazonalError)

}
