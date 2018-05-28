import XCTest
import SensazonalTestUtils
@testable import Sensazonal

final class FoodViewModelTests: XCTestCase {

    func testInit() {
        let viewModel = FoodViewModel.sample

        XCTAssertEqual(viewModel.name, "Name")
        XCTAssertEqual(viewModel.photo, #imageLiteral(resourceName: "Content/STRAWBERRY"))
    }

}
