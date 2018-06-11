import Foundation

class FavoriteFoodUserDefaultsGateway: FavoriteFoodsGateway {

    func foods(onComplete: (Result<[KeyName]>) -> Void) {
        onComplete(.success(UserDefaults.standard.array(forKey: .favoriteFoods)))
    }

}
