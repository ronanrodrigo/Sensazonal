import XCTest
import SensazonalTestUtils
@testable import Sensazonal

final class SelectMonthTransitionTests: XCTestCase {

    private let viewController = UIViewController()
    private let delegate = StubFoodListControllerDelegate() // swiftlint:disable:this weak_delegate
    private var interactiveTransition: InteractiveTransition!
    private var monthTransition: SelectMonthTransition!

    override func setUp() {
        super.setUp()
        viewController.view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        interactiveTransition = InteractiveTransition()
        monthTransition = SelectMonthTransition(viewController: viewController,
                                                interactiveTransition: interactiveTransition,
                                                delegate: delegate)
    }

    func testCloseMonthSelectorWithPanGestureWhenBeganGestureThenInteractiveTransitionStarted() {
        let gesture = StubPanGesture()

        monthTransition.closeMonthSelectorWithPan(gesture)

        XCTAssertTrue(interactiveTransition.hasStarted)
    }

    func testCloseMonthSelectorWithPanGestureWhenBeganGestureThenDelegateDidCloseMonthSelector() {
        let gesture = StubPanGesture()

        monthTransition.closeMonthSelectorWithPan(gesture)

        XCTAssertTrue(delegate.didCloseMonthSelector)
    }

    func testCloseMonthSelectorWithPanGestureWhenProgressIsOverThenThresholdAndChangedGestureThenInteractiveTransitionShouldFinish() {
        let percentThreshold = 20
        let gesture = generateGesture(with: .changed, translationPoint: percentThreshold + 1)

        monthTransition.closeMonthSelectorWithPan(gesture)

        XCTAssertTrue(interactiveTransition.shouldFinish)
    }

    func testCloseMonthSelectorWithPanGestureWhenProgressIsEqualThenThresholdAndChangedGestureThenInteractiveTransitionShouldNotFinish() {
        let percentThreshold = 20
        let gesture = generateGesture(with: .changed, translationPoint: percentThreshold)

        monthTransition.closeMonthSelectorWithPan(gesture)

        XCTAssertFalse(interactiveTransition.shouldFinish)
    }

    func testCloseMonthSelectorWithPanGestureWhenProgressIsLessThenThresholdAndChangedGestureThenInteractiveTransitionShouldNotFinish() {
        let percentThreshold = 20
        let gesture = generateGesture(with: .changed, translationPoint: percentThreshold)

        monthTransition.closeMonthSelectorWithPan(gesture)

        XCTAssertFalse(interactiveTransition.shouldFinish)
    }

    func testCloseMonthSelectorWithPanGestureWhenCanceledGestureThenInteractiveTransitionHasNotStarted() {
        let gesture = generateGesture(with: .cancelled)

        monthTransition.closeMonthSelectorWithPan(gesture)

        XCTAssertFalse(interactiveTransition.hasStarted)
    }

    func testCloseMonthSelectorWithPanGestureWhenEndedGestureThenInteractiveTransitionHasNotStarted() {
        let gesture = generateGesture(with: .ended)

        monthTransition.closeMonthSelectorWithPan(gesture)

        XCTAssertFalse(interactiveTransition.hasStarted)
    }

    func testCloseMonthSelectorWithTapGestureThenCallDelegateCloseMonthSelector() {
        monthTransition.closeMonthSelectorWithTap()

        XCTAssertTrue(delegate.didCloseMonthSelector)
    }

    private func generateGesture(with state: UIGestureRecognizer.State = .began, translationPoint: Int = 0) -> UIPanGestureRecognizer {
        let gesture = StubPanGesture(state: state, translationPoint: translationPoint)
        gesture.state = state
        return gesture
    }

}
