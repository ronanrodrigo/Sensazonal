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
                    .sorted { $0.keyGroup > $1.keyGroup }
                    .map { Food(keyName: $0.keyName, keyGroup: $0.keyGroup, months: $0.months) }
                DispatchQueue.main.async { onComplete(.success(foods)) }
            } catch {
                DispatchQueue.main.async { onComplete(.failure(.invalidData)) }
            }
        }

    }

}
