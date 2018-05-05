import XCTest
@testable import Sensazonal

final class MonthPickerTests: XCTestCase {

    func testInitWithCoderThenLogErrorMessage() {
        let stubLogger = StubLogger()
        Logger.shared = stubLogger

        let picker = MonthPicker(coder: NSCoder())

        XCTAssertTrue(stubLogger.fileLogged.contains("MonthPicker.swift"))
        XCTAssertEqual(stubLogger.functionLogged, "init(coder:)")
        XCTAssertNil(picker)
    }

}
