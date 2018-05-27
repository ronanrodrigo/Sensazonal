import UIKit

protocol AnimateTransition {
    func execute(using transitionContext: UIViewControllerContextTransitioning, onComplete: @escaping () -> Void)
}
