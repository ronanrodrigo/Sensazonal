import UIKit

struct FoodListViewControllerFactory {

    static func make() -> UIViewController & FoodListBinder {
        return FoodListViewController()
    }

}
