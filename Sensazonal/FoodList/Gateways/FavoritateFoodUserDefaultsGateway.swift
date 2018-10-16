import Foundation

final class FavoritateFoodUserDefaultsGateway: FavoritateFoodGateway {

    func favorite(foodKey: Food.Key, onComplete: (Result<Food.Key>) -> Void) {
        let foods: [KeyName] = UserDefaults.standard.array(forKey: UserDefaults.Key.favoriteFoods)

        let newFoods = foods + [foodKey.name]
        let distinctFoods = Array(Set(newFoods))
        UserDefaults.standard.set(distinctFoods, forKey: UserDefaults.Key.favoriteFoods)

        onComplete(.success(foodKey))
    }

    func unfavorite(foodKey: Food.Key, onComplete: (Result<Food.Key>) -> Void) {
        let foods: [KeyName] = UserDefaults.standard.array(forKey: UserDefaults.Key.favoriteFoods)

        let newFoods = Set(foods).filter({ $0 != foodKey.name }).map({ $0 })
        UserDefaults.standard.set(newFoods, forKey: UserDefaults.Key.favoriteFoods)

        onComplete(.success(foodKey))
    }

}
