import UIKit

final class FadeAndAppearAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {

    private var backdrop = BackdropView()
    private let presentTransition: AnimateTransition
    private let dismissTransition: AnimateTransition

    init(presentTransition: AnimateTransition, dismissTransition: AnimateTransition) {
        self.presentTransition = presentTransition
        self.dismissTransition = dismissTransition
        super.init()
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let destination = transitionContext.viewController(forKey: .to) else { return }

        if destination.isBeingPresented {
            transitionContext.containerView.addSubview(backdrop)
            presentTransition.execute(using: transitionContext) { self.backdrop.alpha = 1 }
        } else {
            dismissTransition.execute(using: transitionContext) { self.backdrop.alpha = 0 }
        }
    }

}
