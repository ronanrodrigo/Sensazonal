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
    }

}
