// sourcery: AutoMock
public protocol ListFoodPresenter {

    func present(groupedFoods: [GroupedFoods], month: Month)
    func present(error: ListFoodError)

}
