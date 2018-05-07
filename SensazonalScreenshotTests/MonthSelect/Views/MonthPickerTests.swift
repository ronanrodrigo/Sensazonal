import XCTest
import FBSnapshotTestCase
import SensazonalTestUtils
@testable import Sensazonal

final class MonthPickerTests: FBSnapshotTestCase {

    func testViewCreationWhenDataProviderHasItemsThenPresentMonthSelectorWithMonths() {
        let view = MonthPicker(dataProvider: StubMonthSelectorDataProvider(), finishAction: {})

        FBSnapshotVerifyView(view)
        FBSnapshotVerifyLayer(view.layer)
    }

}
