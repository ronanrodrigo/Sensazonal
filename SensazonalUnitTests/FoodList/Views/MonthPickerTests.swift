import XCTest
@testable import Sensazonal

final class MonthPickerTests: XCTestCase {

    func testToggleVisibilityWhenVisibleThenAlphaChangesToZero() {
        let picker = MonthPicker(delegateAndDataSource: FakePickerViewDataSourceAndDelegate())
        picker.alpha = 1

        picker.toggleVisibility()

        XCTAssertEqual(picker.alpha, 0)
    }

    func testToggleVisibilityWhenInvisibleThenAlphaChangesToOne() {
        let picker = MonthPicker(delegateAndDataSource: FakePickerViewDataSourceAndDelegate())
        picker.alpha = 0

        picker.toggleVisibility()

        XCTAssertEqual(picker.alpha, 1)
    }

}

class FakePickerViewDataSourceAndDelegate: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { return 0 }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { return 0 }
}
