import Core
import Foundation
import Share

class ListFoodTableViewControllerDependency: NSObject {

    let presenter = ListFoodPresenterViewController()
    lazy var interactor = ListFoodInteractorFactory.make(presenter: presenter)

}
