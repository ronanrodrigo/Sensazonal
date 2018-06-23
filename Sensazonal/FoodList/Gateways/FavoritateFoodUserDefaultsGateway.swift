import Foundation

final class FavoritateFoodUserDefaultsGateway: FavoritateFoodGateway {

    func favorite(shouldFavorite: Bool, foodKeyName: KeyName, onComplete: (Result<KeyName>) -> Void) {
        UserDefaults.standard.set(shouldFavorite, forKey: UserDefaults.Key.favoriteFoods)
        onComplete(.success(foodKeyName))
    }

}
