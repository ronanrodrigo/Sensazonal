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

        XCTAssertEqual(bindable.bindErrorViewModelReceivedErrorViewModel.title, localize("internal_error"))
        XCTAssertEqual(bindable.bindErrorViewModelReceivedErrorViewModel.message, localize("this_should_not_happen"))
    }

    func test_presentError_invalidMonthError_bindWithWrongMonthMessages() {
        presenter.present(error: .invalidMonth)

        XCTAssertEqual(bindable.bindErrorViewModelReceivedErrorViewModel.title, localize("invalid_month"))
        XCTAssertEqual(bindable.bindErrorViewModelReceivedErrorViewModel.message, localize("select_another_month"))
    }

    func test_presentError_notFoundError_bindWithNotFoundMessages() {
        presenter.present(error: .notFound)

        XCTAssertEqual(bindable.bindErrorViewModelReceivedErrorViewModel.title, localize("source_not_found"))
        XCTAssertEqual(bindable.bindErrorViewModelReceivedErrorViewModel.message, localize("this_should_not_happen"))
    }

}
