import Core
import Foundation
import Share

class ListFoodViewControllerDependency: NSObject {

    let presenter = ListFoodBinderPresenter()
    lazy var interactor = ListFoodInteractorFactory.make(presenter: presenter)

}
