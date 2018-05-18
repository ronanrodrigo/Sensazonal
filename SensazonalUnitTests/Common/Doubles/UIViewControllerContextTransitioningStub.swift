import UIKit

class UIViewControllerContextTransitioningStub: NSObject, UIViewControllerContextTransitioning {
    var containerView = UIView(frame: .zero)
    var isAnimated = true
    var isInteractive = true
    var transitionWasCancelled = false
    var presentationStyle = UIModalPresentationStyle.custom
    var targetTransform = CGAffineTransform()
    let viewController: UIViewController?
    func updateInteractiveTransition(_ percentComplete: CGFloat) { }
    func finishInteractiveTransition() { }
    func cancelInteractiveTransition() { }
    func pauseInteractiveTransition() { }
    func completeTransition(_ didComplete: Bool) { }
    func view(forKey key: UITransitionContextViewKey) -> UIView? { return nil }
    func initialFrame(for vc: UIViewController) -> CGRect { return .zero } // swiftlint:disable:this identifier_name
    func finalFrame(for vc: UIViewController) -> CGRect { return .zero } // swiftlint:disable:this identifier_name

    init(viewController: UIViewController?) {
        self.viewController = viewController
        super.init()
    }

    func viewController(forKey key: UITransitionContextViewControllerKey) -> UIViewController? {
        return viewController
    }
}
