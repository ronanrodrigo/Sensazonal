import Foundation

public struct GroupedFoods {
    public let uuid: UUID
    public let name: String
    public let foods: [Food]

    public init(uuid: UUID, name: String, foods: [Food]) {
        self.uuid = uuid
        self.name = name
        self.foods = foods
    }

    public struct Food {
        public let uuid: UUID
        public let name: String
        public let favorited: Bool
        public let months: [Int]

        public init(uuid: UUID, name: String, favorited: Bool, months: [Int]) {
            self.uuid = uuid
            self.name = name
            self.favorited = favorited
            self.months = months
        }
    }
}
