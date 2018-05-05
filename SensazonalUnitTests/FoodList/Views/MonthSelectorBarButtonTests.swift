import XCTest
import UIKit
@testable import Sensazonal

final class MonthSelectorBarButtonTests: XCTestCase {

    func testDidTouchAtButtonInFirstActionThenCallCallbackFunction() {
        var didSelectCallback = false
        let selectAction: () -> Void = { didSelectCallback = true }
        let button = MonthSelectorBarButton(selectAction: selectAction)

        button.perform(button.action!)

        XCTAssertTrue(didSelectCallback)
    }

    func testInitWithCoderThenLogErrorMessage() {
        let stubLogger = StubLogger()
        Logger.shared = stubLogger

        let button = MonthSelectorBarButton(coder: NSCoder())

        XCTAssertTrue(stubLogger.fileLogged.contains("MonthSelectorBarButton.swift"))
        XCTAssertEqual(stubLogger.functionLogged, "init(coder:)")
        XCTAssertNil(button)
    }

}
