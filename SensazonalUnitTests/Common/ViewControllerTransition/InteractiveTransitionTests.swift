import XCTest
@testable import Sensazonal

final class InteractiveTransitionTests: XCTestCase {

    func testEndTransitionWhenShouldFinishThenCallFinish() {
        let transition = StubInteractiveTransition()
        transition.shouldFinish = true

        transition.endTransition()

        XCTAssertTrue(transition.didCallFinish)
    }

    func testEndTransitionWhenShouldNotFinishThenCallCancel() {
        let transition = StubInteractiveTransition()
        transition.shouldFinish = false

        transition.endTransition()

        XCTAssertTrue(transition.didCalCancel)
    }

}
