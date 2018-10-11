import UIKit

final class ListFoodJsonFileGateway: ListFoodGateway {

    func foods(byMonth month: Int, onComplete: @escaping (Result<[Food]>) -> Void) {
        guard let filePath = Bundle.main.path(forResource: "foods.min", ofType: "json") else {
            return onComplete(.failure(.notFound))
        }

        let queue = DispatchQueue(label: "com.ronanrodrigo.sensazonal.\(#function)")

        queue.async {
            do {
                let foodsData = try Data(contentsOf: URL(fileURLWithPath: filePath), options: .mappedIfSafe)
                let foods = try JSONDecoder()
                    .decode([FoodCodable].self, from: foodsData)
                    .filter { $0.months.contains(month) }
                    .compactMap(self.generateFoods)
                    .sorted { $0.favorited && !$1.favorited }
                DispatchQueue.main.async { onComplete(.success(foods)) }
            } catch {
                DispatchQueue.main.async { onComplete(.failure(.invalidData)) }
            }
        }
    }

    private func generateFoods(food: FoodCodable) -> Food {
        let favoriteFoods: [String] = UserDefaults.standard.array(forKey: .favoriteFoods)
        let isFavorited = favoriteFoods.contains(food.keyName)
        return Food(key: .init(food.keyName, food.keyGroup), months: food.months, favorited: isFavorited)
    }

}
