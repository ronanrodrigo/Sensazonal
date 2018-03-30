import XCTest
@testable import Sensazonal

final class NavigationViewControllerTests: XCTestCase {

    func testInitWithNibNameAndBundleThenSetupAppearance() {
        let navigationController = NavigationViewController(nibName: nil, bundle: nil)

        XCTAssertTrue(navigationController.navigationBar.prefersLargeTitles)
        XCTAssertEqual(navigationController.navigationBar.backgroundColor, .white)
        XCTAssertEqual(navigationController.navigationBar.barTintColor, .white)
        XCTAssertNotNil(navigationController.navigationBar.shadowImage)
    }

    func testInitWithRootViewControllerThenSetupAppearance() {
        let navigationController = NavigationViewController(rootViewController: UIViewController())

        XCTAssertTrue(navigationController.navigationBar.prefersLargeTitles)
        XCTAssertEqual(navigationController.navigationBar.backgroundColor, .white)
        XCTAssertEqual(navigationController.navigationBar.barTintColor, .white)
        XCTAssertNotNil(navigationController.navigationBar.shadowImage)
    }

    func testInitWithCoderThenLogErrorMessage() {
        let stubLogger = StubLogger()
        Logger.shared = stubLogger

        let navigationController = NavigationViewController(coder: NSCoder())

        XCTAssertTrue(stubLogger.fileLogged.contains("NavigationViewController.swift"))
        XCTAssertEqual(stubLogger.functionLogged, "init(coder:)")
        XCTAssertNil(navigationController)
    }

}
