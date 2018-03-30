import XCTest
@testable import Sensazonal

final class FoodListControllerTests: XCTestCase {

    func testInitWhenConstructedThenHasFoodListViewControllerAsRootViewController() {
        let controller = FoodListController()

        XCTAssertTrue(controller.viewController.viewControllers[0].isKind(of: FoodListCollectionViewController.self))
    }

    func testInitWhenConstructedThenExecuteFoodListInteractor() {
        var interactor: StubListFoodByMonthInteractor!

        _ = FoodListController {
            interactor = StubListFoodByMonthInteractor(gateway: ListFoodStubGateway(), presenter: $0)
            return interactor
        }

        XCTAssertTrue(interactor.didCallList)
    }

}
