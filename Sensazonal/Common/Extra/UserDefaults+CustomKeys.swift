import Foundation

extension UserDefaults {
    enum Key: String {
        case favoriteFoods
    }

    func array<T>(forKey key: Key) -> [T] {
        guard let values = UserDefaults.standard.array(forKey: key.rawValue) as? [T] else { return [] }
        return values
    }

    func set(_ value: Any?, forKey key: Key) {
        defer { synchronize() }
        set(value, forKey: key.rawValue)
    }
}
