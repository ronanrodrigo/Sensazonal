import Core
import Foundation

final class ListFoodGatewayLocal: ListFoodGateway {

    let foodJsonURL: URL?
    private let queueLabel = String(describing: ListFoodGatewayLocal.self)

    init(bundle: Bundle = Bundle(for: ListFoodGatewayLocal.self),
         fileName: String = "GroupedFoods") {
        guard let path = bundle.path(forResource: fileName, ofType: "json") else {
            foodJsonURL = nil; return
        }
        foodJsonURL = URL(fileURLWithPath: path)
    }
    
    func all(byMonth month: Month, onComplete: @escaping (Result<[GroupedFoods], ListFoodError>) -> Void) {
        let complete: (Result<[GroupedFoods], ListFoodError>) -> Void = { result in
            DispatchQueue.main.async { onComplete(result) }
        }
        DispatchQueue(label: queueLabel).async { [weak self] in
            do {
                guard let url = self?.foodJsonURL else { return complete(.failure(.notFound)) }
                let decodable = try JSONDecoder().decode(ListFoodCodable.self, from: Data(contentsOf: url))
                let groupedFoods = ListFoodGatewayLocal
                    .generateGroupedFoods(from: decodable, month: month)
                complete(.success(groupedFoods))
            } catch {
                complete(.failure(.invalid))
            }
        }
    }

}

private extension ListFoodGatewayLocal {

    static func generateGroupedFoods(from decodable: ListFoodCodable, month: Month) -> [GroupedFoods] {
        return decodable
            .groups
            .compactMap { mapToGroupedFoods(from: $0, month: month) }
    }

    static func mapToGroupedFoods(from codable: GroupCodable, month: Month) -> GroupedFoods? {
        let foods = codable.foods
            .filter { $0.months.contains(month.number) }
            .map(GroupedFoods.Food.init)
        if foods.isEmpty { return nil }

        return GroupedFoods(uuid: codable.uuid, name: codable.name, foods: foods)
    }

}
