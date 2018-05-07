import XCTest
import SensazonalTestUtils
@testable import Sensazonal

final class MonthPickerDelegateDataSourceTests: XCTestCase {

    func testNumberOfComponentsThenReturnOne() {
        let datasource = MonthPickerDelegateDataSource(dataProvider: StubMonthSelectorDataProvider())

        let components = datasource.numberOfComponents(in: UIPickerView())

        XCTAssertEqual(components, 1)
    }

    func testNumberOfRowsInComponentWhenDataProviderHasMonthsThenReturnTwelve() {
        let datasource = MonthPickerDelegateDataSource(dataProvider: StubMonthSelectorDataProvider())

        let rows = datasource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)

        XCTAssertEqual(rows, 12)
    }

    func testTitleForRowInComponentWhenDataProviderHasMonthsThenReturnMonthName() {
        let datasource = MonthPickerDelegateDataSource(dataProvider: StubMonthSelectorDataProvider())

        let title = datasource.pickerView(UIPickerView(), titleForRow: 0, forComponent: 0)

        XCTAssertEqual(title, try? MonthFactory.make(position: 0).name)
    }

    func testDidSelectRowInComponentWhenDataProviderHasMonthsThenCallMonthSelected() {
        let dataProvider = StubMonthSelectorDataProvider()
        let datasource = MonthPickerDelegateDataSource(dataProvider: dataProvider)

        datasource.pickerView(UIPickerView(), didSelectRow: 0, inComponent: 0)

        XCTAssertTrue(dataProvider.didMonthSelected)
        XCTAssertEqual(dataProvider.didMonthSelectedWith, 0)
    }

}
