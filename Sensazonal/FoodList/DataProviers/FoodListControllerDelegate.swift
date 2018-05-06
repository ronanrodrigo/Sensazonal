protocol FoodListControllerDelegate: class {

    func closeMonthSelector()
    func openMonthSelector(at month: Month)
    func updateList(with month: Month)

}
