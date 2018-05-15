import UIKit

final class FadeAndAppearAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {

    private var backdrop = BackdropView()

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        if destination.isBeingPresented {
            self.presentAnimateTransition(using: transitionContext)
        } else {
            self.dismissAnimateTransition(using: transitionContext)
        }
    }

    private func presentAnimateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let destinyViewController = transitionContext.viewController(forKey: .to) else { return }
        let finalFrame = transitionContext.finalFrame(for: destinyViewController)
        let containerView = transitionContext.containerView

        let bounds = UIScreen.main.bounds
        destinyViewController.view.frame = finalFrame.offsetBy(dx: 0, dy: bounds.size.height)
        containerView.addSubview(backdrop)
        containerView.addSubview(destinyViewController.view)

        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.1, animations: {
            self.backdrop.alpha = 1
            destinyViewController.view.frame = finalFrame
        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }

    private func dismissAnimateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let originViewController = transitionContext.viewController(forKey: .from) else { return }
        let finalFrameForVc = transitionContext.finalFrame(for: originViewController)
        let bounds = UIScreen.main.bounds

        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.1, animations: {
            originViewController.view.frame = finalFrameForVc.offsetBy(dx: 0, dy: bounds.size.height)
            self.backdrop.alpha = 0
        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }

}
