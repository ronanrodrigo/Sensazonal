import Foundation

typealias KeyName = String
typealias KeyGroupName = String

struct Food {

    let key: Key
    let months: [Int]
    let favorited: Bool

    struct Key {
        let name: KeyName
        let group: KeyGroupName

        init(_ name: KeyName, _ group: KeyGroupName) {
            self.name = name
            self.group = group
        }
    }

}

extension Food.Key: Equatable {
    static func == (lhs: Food.Key, rhs: Food.Key) -> Bool {
        return lhs.name == rhs.name && lhs.group == rhs.group
    }
}
