@testable import Sensazonal

extension FoodViewModel {
    static var sample: FoodViewModel {
        return FoodViewModel(name: "Morango", nameColor: .white, nameBackgroundColor: .red, photo: #imageLiteral(resourceName: "content/strawberry"))
    }
}
