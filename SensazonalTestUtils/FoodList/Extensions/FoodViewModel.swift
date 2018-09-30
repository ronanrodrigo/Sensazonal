@testable import Sensazonal

extension FoodViewModel {

    public static var sample: FoodViewModel {
        return FoodViewModel(name: "Name", photo: #imageLiteral(resourceName: "Content/STRAWBERRY"), favoriteImage: #imageLiteral(resourceName: "Action/HeartFilled"), keyName: "KEY_NAME")
    }

}
