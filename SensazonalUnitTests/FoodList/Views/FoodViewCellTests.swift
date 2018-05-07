import XCTest
@testable import Sensazonal

final class FoodViewCellTests: XCTestCase {

    func testInitWhenUseCoderConstructorThenLogErrorMessage() {
        let stubLogger = StubLogger()
        Logger.shared = stubLogger

        let cell = FoodViewCell(coder: NSCoder())

        XCTAssertNil(cell)
        XCTAssertTrue(stubLogger.fileLogged.contains("FoodViewCell.swift"))
        XCTAssertEqual(stubLogger.functionLogged, "init(coder:)")
    }

}
