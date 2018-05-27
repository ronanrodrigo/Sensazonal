import XCTest
import SensazonalTestUtils
@testable import Sensazonal

final class SelectMonthViewControllerTests: XCTestCase {

    private var viewController: SelectMonthViewController!

    override func setUp() {
        super.setUp()
        viewController = SelectMonthViewController(interactiveTransition: StubInteractiveTransition(),
                                                   transition: FadeAndAppearTransitioningDelegate())
        viewController.delegate = StubFoodListControllerDelegate()
    }

    func testMonthsTotalWhenViewModelHasMonthsThenReturnTotalMonths() throws {
        let month = try MonthFactory.make(number: 1)

        viewController.bind(viewModel: SelectMonthViewModel(currentMonth: month))

        XCTAssertEqual(viewController.monthsTotal(), 12)
    }

    func testMonthNameWhenRequestFirstPositionThenReturnJanuary() throws {
        let month = try MonthFactory.make(number: 1)

        viewController.bind(viewModel: SelectMonthViewModel(currentMonth: month))

        XCTAssertEqual(viewController.monthName(in: 0), month.name)
    }

    func testMonthSelectedWhenSelectSomePositionThenCallControllerDelegate() throws {
        let delegate = StubFoodListControllerDelegate()
        viewController.delegate = delegate
        let month = try MonthFactory.make(number: 1)

        viewController.bind(viewModel: SelectMonthViewModel(currentMonth: month))
        viewController.monthSelected(in: 0)

        XCTAssertTrue(delegate.didUpdateList)
        XCTAssertEqual(delegate.didUpdateListWith!.number, month.number)
    }

    func testInitWhenUseCoderConstructorThenLogErrorMessage() {
        let stubLogger = StubLogger()
        Logger.shared = stubLogger

        let viewController = SelectMonthViewController(coder: NSCoder())

        XCTAssertNil(viewController)
        XCTAssertTrue(stubLogger.fileLogged.contains("SelectMonthViewController.swift"))
        XCTAssertEqual(stubLogger.functionLogged, "init(coder:)")
    }

}
