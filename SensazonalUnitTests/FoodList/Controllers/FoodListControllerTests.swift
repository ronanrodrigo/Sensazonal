import XCTest
@testable import Sensazonal

final class FoodListControllerTests: XCTestCase {

    func testInitWhenConstructedThenHasFoodListViewControllerAsRootViewController() {
        let interactor = ListFoodByMonthInteractor(gateway: ListFoodStubGateway(), presenter: ListFoodStubPresenter())

        let controller = FoodListController(interactor: interactor,
                                            listViewController: FoodListViewController(nibName: nil, bundle: nil))

        XCTAssertTrue(controller.viewController.isKind(of: FoodListViewController.self))
    }

    func testInitWhenConstructedThenExecuteFoodListInteractor() {
        let interactor = StubListFoodByMonthInteractor(gateway: ListFoodStubGateway(), presenter: ListFoodStubPresenter())

        _ = FoodListController(interactor: interactor, listViewController: UIViewController())

        XCTAssertTrue(interactor.didCallList)
    }

}
