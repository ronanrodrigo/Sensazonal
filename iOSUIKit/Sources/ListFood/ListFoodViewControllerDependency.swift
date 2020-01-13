import Core
import Foundation
import Share

class ListFoodViewControllerDependency: NSObject {

    let presenter = ListFoodPresenterViewController()
    lazy var interactor = ListFoodInteractorFactory.make(presenter: presenter)

}
