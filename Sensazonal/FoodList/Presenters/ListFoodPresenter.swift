protocol ListFoodPresenter {
    func presentFoods(_ foods: [Food])
    func presentError(_ error: SensazonalError)
}
