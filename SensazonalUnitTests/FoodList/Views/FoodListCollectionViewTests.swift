import XCTest
@testable import Sensazonal

final class FoodListCollectionViewTests: XCTestCase {

    func testInitWhenUseCoderConstructorThenLogErrorMessage() {
        let stubLogger = StubLogger()
        Logger.shared = stubLogger

        let view = FoodListCollectionView(coder: NSCoder())

        XCTAssertNil(view)
        XCTAssertTrue(stubLogger.fileLogged.contains("FoodListCollectionView.swift"))
        XCTAssertEqual(stubLogger.functionLogged, "init(coder:)")
    }

}
