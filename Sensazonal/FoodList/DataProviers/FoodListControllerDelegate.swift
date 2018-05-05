protocol FoodListControllerDelegate: class {
    func closeMonthSelector()
    func openMonthSelector()
    func updateList(with month: Month)
}
