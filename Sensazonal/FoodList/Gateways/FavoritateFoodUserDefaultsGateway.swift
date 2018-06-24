import Foundation

final class FavoritateFoodUserDefaultsGateway: FavoritateFoodGateway {

    func favorite(foodKeyName: KeyName, onComplete: (Result<KeyName>) -> Void) {
        let foods: [KeyName] = UserDefaults.standard.array(forKey: UserDefaults.Key.favoriteFoods)

        let newFoods = foods + [foodKeyName]
        let distinctFoods = Array(Set(newFoods))
        UserDefaults.standard.set(distinctFoods, forKey: UserDefaults.Key.favoriteFoods)

        onComplete(.success(foodKeyName))
    }

    func unfavorite(foodKeyName: KeyName, onComplete: (Result<KeyName>) -> Void) {
        let foods: [KeyName] = UserDefaults.standard.array(forKey: UserDefaults.Key.favoriteFoods)

        let newFoods = Set(foods).filter({ $0 != foodKeyName }).map({ $0 })
        UserDefaults.standard.set(newFoods, forKey: UserDefaults.Key.favoriteFoods)

        onComplete(.success(foodKeyName))
    }

}
