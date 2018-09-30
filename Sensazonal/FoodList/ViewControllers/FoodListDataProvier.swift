import Foundation

protocol FoodListDataProvider {

    func foodsQuantity(at section: Int) throws -> Int
    func food(at indexPath: IndexPath) throws -> FoodViewModel
    func groupsQuantity() -> Int
    func group(at section: Int) throws -> FoodGroupViewModel
    func favoritateFood(with keyName: KeyName)

}
