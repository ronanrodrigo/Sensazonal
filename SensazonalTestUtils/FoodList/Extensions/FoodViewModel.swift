@testable import Sensazonal

extension FoodViewModel {

    public static var sample: FoodViewModel {
        return FoodViewModel(name: "Name", nameColor: .white, nameBackgroundColor: .red, photo: #imageLiteral(resourceName: "content/strawberry"))
    }

}
