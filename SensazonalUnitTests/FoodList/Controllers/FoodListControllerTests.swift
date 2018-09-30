import XCTest
import SensazonalTestUtils
@testable import Sensazonal

final class FoodListControllerTests: XCTestCase {

    private var gateway: ListFoodStubGateway!

    override func setUp() {
        super.setUp()
        gateway = ListFoodStubGateway()
    }

    func testInitWhenConstructedThenHasFoodListViewControllerAsRootViewController() {
        let interactor = ListFoodByMonthInteractor(gateway: gateway, presenter: ListFoodStubPresenter())

        let controller = FoodListController(interactor: interactor, listViewController: FoodListViewController(nibName: nil, bundle: nil))

        XCTAssertTrue(controller.viewController.isKind(of: FoodListViewController.self))
    }

    func testInitWhenConstructedThenExecuteFoodListInteractor() {
        let interactor = StubListFoodByMonthInteractor(gateway: gateway,
                                                       presenter: ListFoodStubPresenter())

        _ = FoodListController(interactor: interactor, listViewController: UIViewController())

        XCTAssertTrue(interactor.didCallList)
    }

    func testOpenMonthSelectorThenPresentMonthSelectorViewController() {
        let interactor = ListFoodByMonthInteractor(gateway: gateway, presenter: ListFoodStubPresenter())
        let controller = FoodListController(interactor: interactor, listViewController: FoodListViewController(nibName: nil, bundle: nil))
        UIApplication.shared.keyWindow?.rootViewController = controller.viewController

        controller.openMonthSelector(at: GregorianMonth())

        XCTAssertTrue(controller.viewController.presentedViewController!.isKind(of: SelectMonthViewController.self))
    }

    func testUpdateListWhenHasMonthThenCallInteractorListFoodByMonth() throws {
        let interactor = StubListFoodByMonthInteractor(gateway: gateway, presenter: ListFoodStubPresenter())
        let controller = FoodListController(interactor: interactor, listViewController: FoodListViewController(nibName: nil, bundle: nil))
        let month = try MonthFactory.make(number: 11)

        controller.updateList(with: month)

        XCTAssertEqual(interactor.didCallListWithMonth, month.number)
        XCTAssertTrue(interactor.didCallList)
    }

}
