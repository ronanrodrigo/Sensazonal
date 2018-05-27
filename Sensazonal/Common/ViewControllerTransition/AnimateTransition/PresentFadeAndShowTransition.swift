import UIKit

final class PresentFadeAndShowTransition: AnimateTransition {

    private let transitionDuration: TimeInterval

    init(transitionDuration: TimeInterval = 0.3) {
        self.transitionDuration = transitionDuration
    }

    func execute(using transitionContext: UIViewControllerContextTransitioning, onComplete: @escaping () -> Void) {
        guard let destinyViewController = transitionContext.viewController(forKey: .to) else { return }
        let finalFrame = transitionContext.finalFrame(for: destinyViewController)
        let containerView = transitionContext.containerView

        let bounds = UIScreen.main.bounds
        destinyViewController.view.frame = finalFrame.offsetBy(dx: 0, dy: bounds.size.height)
        containerView.addSubview(destinyViewController.view)

        UIView.animate(withDuration: transitionDuration, delay: 0.1, animations: {
            destinyViewController.view.frame = finalFrame
            onComplete()
        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }

}
