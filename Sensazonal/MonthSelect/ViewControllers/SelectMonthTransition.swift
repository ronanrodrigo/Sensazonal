import UIKit

final class SelectMonthTransition {
    lazy var closeMonthSelectorPanGesture = UIPanGestureRecognizer(target: self, action: #selector(closeMonthSelectorWithPan))
    lazy var closeMonthSelectorTapGesture = UITapGestureRecognizer(target: self, action: #selector(closeMonthSelectorWithTap))
    private weak var viewController: UIViewController!
    private weak var interactiveTransition: InteractiveTransition!
    private weak var delegate: FoodListControllerDelegate?

    init(viewController: UIViewController, interactiveTransition: InteractiveTransition, delegate: FoodListControllerDelegate?) {
        self.viewController = viewController
        self.interactiveTransition = interactiveTransition
        self.delegate = delegate
    }

    @objc func closeMonthSelectorWithPan(_ gesture: UIPanGestureRecognizer) {
        guard let viewWithGesture = gesture.view?.superview else { return }
        let point = viewWithGesture.convert(gesture.translation(in: viewWithGesture), to: viewWithGesture)
        let progress = max(point.y / viewController.view.bounds.height, 0)
        let percentThreshold: CGFloat = 0.2
        let veolcity = gesture.velocity(in: viewWithGesture).y

        switch gesture.state {
        case .began:
            interactiveTransition.hasStarted = true
            delegate?.closeMonthSelector()
        case .changed:
            interactiveTransition.shouldFinish = progress > percentThreshold || veolcity > 800
            interactiveTransition.update(progress)
        case .cancelled:
            interactiveTransition.hasStarted = false
            interactiveTransition.completionSpeed = 1
            interactiveTransition.cancel()
        case .ended:
            interactiveTransition.hasStarted = false
            interactiveTransition.completionSpeed = 1 - progress
            interactiveTransition.endTransition()
        default: break
        }
    }

    @objc func closeMonthSelectorWithTap() {
        delegate?.closeMonthSelector()
    }
}
