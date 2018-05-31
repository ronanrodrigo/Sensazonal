import Foundation

struct Food {

    let keyName: String
    let keyGroup: String
    let months: [Int]

}

struct FoodDecodable: Decodable {

    let keyName: String
    let keyGroup: String
    let months: [Int]

    enum CodingKeys: String, CodingKey {
        case keyName = "key_name"
        case keyGroup = "key_group"
        case months
    }

}
