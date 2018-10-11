struct FoodCodable: Codable {

    let keyName: KeyName
    let keyGroup: KeyGroupName
    let months: [Int]

    enum CodingKeys: String, CodingKey {
        case keyName = "key_name"
        case keyGroup = "key_group"
        case months
    }

}
