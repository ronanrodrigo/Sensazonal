import UIKit

final class ListFoodViewPresenter: ListFoodPresenter {

    private typealias GroupedViewModel = [FoodGroupViewModel: [FoodViewModel]]
    private weak var binder: FoodListBinder?

    init(binder: FoodListBinder) {
        self.binder = binder
    }

    func presentError(_ error: SensazonalError) { }

    func presentFoods(_ foods: [Food], monthNumber: Int) {
        do {
            let groupedViewModel = generateGroupedViewModel(with: foods)
            let month = try MonthFactory.make(number: monthNumber)
            let foodListViewModel = FoodListViewModel(foodsViewModel: groupedViewModel, month: month)

            binder?.bind(viewModel: foodListViewModel)
        } catch { presentError(.invalidMonth) }
    }

    private func generateGroupedViewModel(with foods: [Food]) -> GroupedViewModel {
        return foods.reduce(GroupedViewModel()) {
            var newResult = $0
            let groupViewModel = FoodGroupViewModel(name: $1.groupName)
            let foodViewModel = FoodViewModel(name: $1.name, photo: $1.image)

            if newResult[groupViewModel] == nil {
                newResult[groupViewModel] = [foodViewModel]
            } else {
                newResult[groupViewModel]?.append(foodViewModel)
            }
            return newResult
        }
    }

}

fileprivate extension Food {

    var name: String { return Locale.localize(keyName) }
    var image: UIImage { return UIImage(named: imageName) ?? #imageLiteral(resourceName: "Content/BLANK") }
    var groupName: String { return Locale.localize("\(keyGroup)S") }
    private var imageName: String { return "Content/\(keyName)" }

}
