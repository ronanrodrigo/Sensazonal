@testable import SensazonaliOS
import XCTest

final class ListFoodPresenterViewControllerTests: XCTestCase {

    private let presenter = ListFoodPresenterViewController()
    private let bindable = ListFoodTableViewControllerBindMock()

    override func setUp() {
        super.setUp()
        presenter.bindable = bindable
    }

    func test_presentError_invalidError_bindWithInternalMessages() {
        presenter.present(error: .invalid)

        XCTAssertEqual(bindable.bindErrorViewModelReceivedErrorViewModel.title, localize("Internal error"))
        XCTAssertEqual(bindable.bindErrorViewModelReceivedErrorViewModel.message, localize("This should not happen"))
    }

    func test_presentError_invalidMonthError_bindWithWrongMonthMessages() {
        presenter.present(error: .invalidMonth)

        XCTAssertEqual(bindable.bindErrorViewModelReceivedErrorViewModel.title, localize("Invalid month"))
        XCTAssertEqual(bindable.bindErrorViewModelReceivedErrorViewModel.message, localize("Select another month"))
    }

    func test_presentError_notFoundError_bindWithNotFoundMessages() {
        presenter.present(error: .notFound)

        XCTAssertEqual(bindable.bindErrorViewModelReceivedErrorViewModel.title, localize("Source not found"))
        XCTAssertEqual(bindable.bindErrorViewModelReceivedErrorViewModel.message, localize("This should not happen"))
    }

}
