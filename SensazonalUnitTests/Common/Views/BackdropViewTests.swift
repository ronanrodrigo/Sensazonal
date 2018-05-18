import XCTest
@testable import Sensazonal

final class BackdropViewTests: XCTestCase {

    func testInitWithCoderThenLogErrorMessage() {
        let stubLogger = StubLogger()
        Logger.shared = stubLogger

        let button = BackdropView(coder: NSCoder())

        XCTAssertTrue(stubLogger.fileLogged.contains("BackdropView.swift"))
        XCTAssertEqual(stubLogger.functionLogged, "init(coder:)")
        XCTAssertNil(button)
    }

}
