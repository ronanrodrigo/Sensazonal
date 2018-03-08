protocol ListFoodPresentable {
    func present(foods: [Food])
    func present(error: SensazonalError)
}
