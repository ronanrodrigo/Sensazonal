import Foundation

// sourcery: AutoMock
public protocol ListFoodGateway {

    func all(byMonth month: Month, onComplete: @escaping (Result<[GroupedFoods], ListFoodError>) -> Void)

}
