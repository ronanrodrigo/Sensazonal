import XCTest
@testable import Sensazonal

final class FoodViewModelTests: XCTestCase {

    func testInit() {
        let photo = UIImage()

        let viewModel = FoodViewModel(name: "name", nameColor: .black, nameBackgroundColor: .red, photo: photo)

        XCTAssertEqual(viewModel.name, "name")
        XCTAssertEqual(viewModel.nameBackgroundGradient.colors?.count, 2)
        XCTAssertEqual(viewModel.nameColor, .black)
        XCTAssertEqual(viewModel.photo, photo)
    }

}
