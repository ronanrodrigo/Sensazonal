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
                let favoriteFoods: [String] = UserDefaults.standard.array(forKey: .favoriteFoods)
                let foods = try JSONDecoder()
                    .decode([FoodCodable].self, from: foodsData)
                    .filter { $0.months.contains(month) }
                    .compactMap { [weak self] in self?.generateFoods(with: $0, isFavorited: favoriteFoods.contains($0.keyName)) }
                    .sorted { $0.favorited && !$1.favorited }
                DispatchQueue.main.async { onComplete(.success(foods)) }
            } catch {
                DispatchQueue.main.async { onComplete(.failure(.invalidData)) }
            }
        }
    }

    private func generateFoods(with food: FoodCodable, isFavorited: Bool) -> Food {
        return Food(keyName: food.keyName, keyGroup: food.keyGroup, months: food.months, favorited: isFavorited)
    }

}
