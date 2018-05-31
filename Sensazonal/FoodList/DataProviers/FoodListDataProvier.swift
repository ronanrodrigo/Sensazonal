import Foundation

protocol FoodListDataProvider {

    func foodsTotal(for section: Int) -> Int
    func groupsTotal() -> Int
    func groupName(at section: Int) -> String
    func food(at indexPath: IndexPath) -> FoodViewModel

}
