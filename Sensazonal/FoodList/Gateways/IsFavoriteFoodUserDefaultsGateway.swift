import Foundation

class IsFavoriteFoodUserDefaultsGateway: IsFavoriteFoodGateway {

    func validate(by keyName: String) -> Bool {
        return UserDefaults.standard.array(forKey: .favoriteFoods).contains(keyName)
    }

}
