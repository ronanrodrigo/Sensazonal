import Core
import Combine
import Foundation

final class ListFoodGatewayLocal: ListFoodGateway {

    private let foodJsonURL: URL?
    private let queueLabel = String(describing: ListFoodGatewayLocal.self)
    private lazy var queue = DispatchQueue(label: queueLabel)

    init(bundle: Bundle = Bundle(for: ListFoodGatewayLocal.self), fileName: String = "GroupedFoods") {
        foodJsonURL = bundle.path(forResource: fileName, ofType: "json").map(URL.init(fileURLWithPath:))
    }
    
    func all(byMonth month: Month, onComplete: @escaping (Result<[GroupedFoods], ListFoodError>) -> Void) {
        queue.async { [weak self] in
            self?.fetchFoods(month: month, onComplete: onComplete)
        }
    }

    func all(byMonth month: Month) -> AnyPublisher<[GroupedFoods], ListFoodError> {
        return Future { [weak self] promise in
            self?.fetchFoods(month: month, onComplete: promise)
        }.eraseToAnyPublisher()
    }

    private func fetchFoods(month: Month, onComplete: @escaping (Result<[GroupedFoods], ListFoodError>) -> Void) {
        let complete = onComplete ≥ DispatchQueue.main
        guard let url = foodJsonURL else { return complete(.failure(.notFound)) }
        do {
            let decodable = try JSONDecoder().decode(ListFoodCodable.self, from: Data(contentsOf: url))
            let groupedFoods = ListFoodGatewayLocal.generateGroupedFoods(from: decodable, month: month)
            complete(.success(groupedFoods))
        } catch {
            complete(.failure(.invalid))
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
