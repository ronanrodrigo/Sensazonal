protocol ListFoodPresentable {
    func presentFoods(_ foods: [Food])
    func presentError(_ error: SensazonalError)
}
