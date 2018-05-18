import XCTest
@testable import Sensazonal

final class FadeAndAppearPresentationControllerTests: XCTestCase {

    func testShouldRemovePresentersViewThenReturnFalse() {
        let presentationController = FadeAndAppearPresentationController(presentedViewController: UIViewController(), presenting: nil)

        let shouldRemovePresentersView = presentationController.shouldRemovePresentersView

        XCTAssertFalse(shouldRemovePresentersView)
    }

}
