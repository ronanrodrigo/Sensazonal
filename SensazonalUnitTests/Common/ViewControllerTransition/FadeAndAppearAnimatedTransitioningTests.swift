import XCTest
@testable import Sensazonal

final class FadeAndAppearAnimatedTransitioningTests: XCTestCase {

    func testAnimateTransitionWhenIsBeingPresentedThenCallPresentTransition() {
        let presentTransitionStub = AnimateTransitionStub()
        let transition = FadeAndAppearAnimatedTransitioning(presentTransition: presentTransitionStub,
                                                            dismissTransition: DismissFadeAndHideTransition())
        let viewController = StubBeingPresentedViewController(isBeingPresented: true)
        let contextTransitioning = UIViewControllerContextTransitioningStub(viewController: viewController)

        transition.animateTransition(using: contextTransitioning)

        XCTAssertTrue(presentTransitionStub.didCallExecute)
    }

    func testAnimateTransitionWhenIsNotBeingPresentedThenCallDismissTransition() {
        let dismissTransitionStub = AnimateTransitionStub()
        let transition = FadeAndAppearAnimatedTransitioning(presentTransition: PresentFadeAndShowTransition(),
                                                            dismissTransition: dismissTransitionStub)
        let viewController = StubBeingPresentedViewController(isBeingPresented: false)
        let contextTransitioning = UIViewControllerContextTransitioningStub(viewController: viewController)

        transition.animateTransition(using: contextTransitioning)

        XCTAssertTrue(dismissTransitionStub.didCallExecute)
    }

    func testAnimateTransitionWhenHasNoneDestinationViewControllerThenDontAnyTransition() {
        let dismissTransitionStub = AnimateTransitionStub()
        let presentTransitionStub = AnimateTransitionStub()
        let transition = FadeAndAppearAnimatedTransitioning(presentTransition: presentTransitionStub,
                                                            dismissTransition: dismissTransitionStub)
        let contextTransitioning = UIViewControllerContextTransitioningStub(viewController: nil)

        transition.animateTransition(using: contextTransitioning)

        XCTAssertFalse(dismissTransitionStub.didCallExecute)
        XCTAssertFalse(presentTransitionStub.didCallExecute)
    }

    func testTransitionDurationThenReturn3Decimals() {
        let transition = FadeAndAppearAnimatedTransitioning(presentTransition: PresentFadeAndShowTransition(),
                                                            dismissTransition: DismissFadeAndHideTransition())

        let transitionDuration = transition.transitionDuration(using: nil)

        XCTAssertEqual(transitionDuration, 0.3)
    }

}
