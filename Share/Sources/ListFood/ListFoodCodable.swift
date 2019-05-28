import Core
import Foundation

struct ListFoodCodable: Codable {
    let groups: [GroupCodable]
}

struct GroupCodable: Codable {
    let uuid: UUID
    let name: String
    let foods: [FoodCodable]
}

struct FoodCodable: Codable {
    let uuid, name: String
    let months: [Int]
}

extension GroupedFoods.Food {
    init(from foodDecodable: FoodCodable) {
        let uuid = UUID(uuidString: foodDecodable.uuid) ?? UUID()
        self.init(uuid: uuid, name: foodDecodable.name, favorited: false, months: foodDecodable.months)
    }
}
