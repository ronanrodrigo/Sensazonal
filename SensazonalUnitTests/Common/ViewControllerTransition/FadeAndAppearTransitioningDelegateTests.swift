import XCTest
@testable import Sensazonal

final class FadeAndAppearTransitioningDelegateTests: XCTestCase {

    private var transitioningDelegate: FadeAndAppearTransitioningDelegate! // swiftlint:disable:this weak_delegate

    override func setUp() {
        super.setUp()
        transitioningDelegate = FadeAndAppearTransitioningDelegate()
    }

    func testAnimationControllerForPresentedViewControllerThenReturnFadeAndAppearAnimatedTransition() {
        let customtransition = transitioningDelegate.animationController(forPresented: UIViewController(), presenting: UIViewController(),
                                                                         source: UIViewController())

        XCTAssertTrue(customtransition!.isKind(of: FadeAndAppearAnimatedTransitioning.self))
    }

    func testAnimationControllerForDismissedViewControllerThenReturnFadeAndAppearAnimatedTransition() {
        let customtransition = transitioningDelegate.animationController(forDismissed: UIViewController())

        XCTAssertTrue(customtransition!.isKind(of: FadeAndAppearAnimatedTransitioning.self))
    }

    func testPrestantionControllerThenReturnFadeAndAppearPresentationController() {
        let customtransition = transitioningDelegate.presentationController(forPresented: UIViewController(),
                                                                            presenting: UIViewController(),
                                                                            source: UIViewController())

        XCTAssertTrue(customtransition!.isKind(of: FadeAndAppearPresentationController.self))
    }

    func testPrestantionControllerWhenPresentingIsNilThenReturnFadeAndAppearPresentationController() {
        let customtransition = transitioningDelegate.presentationController(forPresented: UIViewController(), presenting: nil,
                                                                            source: UIViewController())

        XCTAssertTrue(customtransition!.isKind(of: FadeAndAppearPresentationController.self))
    }

    func testInteractionControllerForDismissalWhenInteractiveTransitionIsNilThenReturnNil() {
        let interactiveTransition =
            transitioningDelegate.interactionControllerForDismissal(using: FadeAppearAnimatedTransitioningFactory.make())

        XCTAssertNil(interactiveTransition)
    }

    func testInteractionControllerForDismissalWhenInteractiveTransitionHasNotStartedThenReturnNil() {
        transitioningDelegate.interactiveTransition = InteractiveTransition()
        transitioningDelegate.interactiveTransition?.hasStarted = false

        let interactiveTransition =
            transitioningDelegate.interactionControllerForDismissal(using: FadeAppearAnimatedTransitioningFactory.make())

        XCTAssertNil(interactiveTransition)
    }

    func testInteractionControllerForDismissalWhenInteractiveTransitionHasStartedThenAnInteractiveTransition() {
        transitioningDelegate.interactiveTransition = InteractiveTransition()
        transitioningDelegate.interactiveTransition?.hasStarted = true

        let interactiveTransition =
            transitioningDelegate.interactionControllerForDismissal(using: FadeAppearAnimatedTransitioningFactory.make())

        XCTAssertNotNil(interactiveTransition)
    }

}
