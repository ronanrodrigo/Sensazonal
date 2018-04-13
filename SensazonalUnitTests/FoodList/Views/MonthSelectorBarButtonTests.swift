import XCTest
import UIKit
@testable import Sensazonal

final class MonthSelectorBarButtonTests: XCTestCase {

    func testDidTouchAtButtonThenCallCallbackFunction() {
        var didRunCallback = false
        let callback: () -> Void = { didRunCallback = true }
        let button = MonthSelectorBarButton(firstAction: callback, secondAction: callback)

        button.perform(button.action!)

        XCTAssertTrue(didRunCallback)
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
