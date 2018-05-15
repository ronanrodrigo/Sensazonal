import UIKit

final class DismissFadeAndHideTransition: AnimateTransition {

    private let transitionDuration: TimeInterval

    init(transitionDuration: TimeInterval = 0.3) {
        self.transitionDuration = transitionDuration
    }

    func execute(using transitionContext: UIViewControllerContextTransitioning, onComplete: @escaping () -> Void) {
        guard let originViewController = transitionContext.viewController(forKey: .from) else { return }
        let finalFrame = transitionContext.finalFrame(for: originViewController)
        let bounds = UIScreen.main.bounds

        UIView.animate(withDuration: transitionDuration, delay: 0.1, animations: {
            originViewController.view.frame = finalFrame.offsetBy(dx: 0, dy: bounds.size.height)
            onComplete()
        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }

}
