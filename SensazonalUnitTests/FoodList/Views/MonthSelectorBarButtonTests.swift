import XCTest
import UIKit
@testable import Sensazonal

final class MonthSelectorBarButtonTests: XCTestCase {

    func testDidTouchAtButtonInFirstActionThenCallCallbackFunction() {
        var didRunFirstCallback = false
        let firstCallback: () -> Void = { didRunFirstCallback = true }
        let button = MonthSelectorBarButton(firstAction: firstCallback, secondAction: {})

        button.perform(button.action!)

        XCTAssertTrue(didRunFirstCallback)
    }

    func testDidTouchAtButtonInSecondActionThenCallCallbackFunction() {
        var didRunSecondCallback = false
        let secondCallback: () -> Void = { didRunSecondCallback = true }
        let button = MonthSelectorBarButton(firstAction: {}, secondAction: secondCallback)

        button.perform(button.action!)
        button.perform(button.action!)

        XCTAssertTrue(didRunSecondCallback)
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
