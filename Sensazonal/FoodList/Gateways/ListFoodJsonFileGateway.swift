import UIKit

final class ListFoodJsonFileGateway: ListFoodGateway {

    func foods(byMonth month: Int, onComplete: @escaping (Result<[Food]>) -> Void) {
        guard let filePath = Bundle.main.path(forResource: "foods.min", ofType: "json") else {
            return onComplete(.failure(.notFound))
        }

        DispatchQueue(label: "com.ronanrodrigo.sensazonal.\(#function)").async {
            ListFoodJsonFileGateway.fetchFood(byMonth: month, filePath: filePath, onComplete: onComplete)
        }
    }

    private static func fetchFood(byMonth month: Int, filePath: String, onComplete: @escaping (Result<[Food]>) -> Void) {
        do {
            let foodsData = try Data(contentsOf: URL(fileURLWithPath: filePath), options: .mappedIfSafe)
            let foods = try JSONDecoder()
                .decode([FoodCodable].self, from: foodsData)
                .filter { $0.months.contains(month) }
                .compactMap(ListFoodJsonFileGateway.generateFoods)
                .sorted { $0.favorited && !$1.favorited }
            DispatchQueue.main.async { onComplete(.success(foods)) }
        } catch {
            DispatchQueue.main.async { onComplete(.failure(.invalidData)) }
        }
    }

    private static func generateFoods(food: FoodCodable) -> Food {
        let favoriteFoods: [String] = UserDefaults.standard.array(forKey: .favoriteFoods)
        let isFavorited = favoriteFoods.contains(food.keyName)
        return Food(key: .init(food.keyName, food.keyGroup), months: food.months, favorited: isFavorited)
    }

}
