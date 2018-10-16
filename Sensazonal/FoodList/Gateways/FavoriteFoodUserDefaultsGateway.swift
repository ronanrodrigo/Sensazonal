import Foundation

class FavoriteFoodUserDefaultsGateway: FavoriteFoodsGateway {

    func foods(onComplete: (Result<[Food.Key]>) -> Void) {
        onComplete(.success(UserDefaults.standard.array(forKey: .favoriteFoods)))
    }

}
