import UIKit

final class BackdropView: UIView {

    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.black.withAlphaComponent(0.6)
        alpha = 0
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        guard let superview = superview else { return }
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            topAnchor.constraint(equalTo: superview.topAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)])
    }

}

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

        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, animations: {
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

        UIView.animate(withDuration: 0.5, animations: {
            originViewController.view.frame = finalFrameForVc.offsetBy(dx: 0, dy: bounds.size.height)
            self.backdrop.alpha = 0
        }, completion: { _ in
            self.backdrop.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }

}

final class FadeAndAppearTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    private let customTransition = FadeAndAppearAnimatedTransitioning()

    func animationController(forPresented presented: UIViewController, presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.customTransition
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.customTransition
    }

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController? {
        return FadeAndAppearPresentationController(presentedViewController: presented, presenting: presenting)
    }
}

final class FadeAndAppearPresentationController: UIPresentationController {
    override var shouldRemovePresentersView: Bool { return false }
}
