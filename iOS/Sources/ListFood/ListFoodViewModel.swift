import Foundation

struct ListFoodViewModel {
    static let empty = ListFoodViewModel(title: "", groupedFoodViewModels: [])
    let title: String
    let groupedFoodViewModels: [GroupedFoodViewModel]

}

struct GroupedFoodViewModel {
    let uuid: UUID
    let group: String
    let foods: [FoodViewModel]
}

struct FoodViewModel {
    let uuid: UUID
    let name: String
}
