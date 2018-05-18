import UIKit

final class FadeAndAppearTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {

    private let customTransition = FadeAppearAnimatedTransitioningFactory.make()
    var interactiveTransition: InteractiveTransition?

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

    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) ->
        UIViewControllerInteractiveTransitioning? {
            guard let interactiveTransition = self.interactiveTransition, interactiveTransition.hasStarted else { return nil }
            return interactiveTransition
    }

}
