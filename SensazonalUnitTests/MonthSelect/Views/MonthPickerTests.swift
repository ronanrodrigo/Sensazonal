import XCTest
import FBSnapshotTestCase
@testable import Sensazonal

final class MonthPickerTests: FBSnapshotTestCase {

    func testInitWithCoderThenLogErrorMessage() {
        let stubLogger = StubLogger()
        Logger.shared = stubLogger

        let picker = MonthPicker(coder: NSCoder())

        XCTAssertTrue(stubLogger.fileLogged.contains("MonthPicker.swift"))
        XCTAssertEqual(stubLogger.functionLogged, "init(coder:)")
        XCTAssertNil(picker)
    }

    func testViewCreationWhenDataProviderHasItemsThenPresentMonthSelectorWithMonths() {
        let view = MonthPicker(dataProvider: StubMonthSelectorDataProvider(), finishAction: {})

        FBSnapshotVerifyView(view)
        FBSnapshotVerifyLayer(view.layer)
    }

}
