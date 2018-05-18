import UIKit
@testable import Sensazonal

class AnimateTransitionStub: AnimateTransition {

    var didCallExecute = false

    func execute(using transitionContext: UIViewControllerContextTransitioning, onComplete: @escaping () -> Void) {
        didCallExecute = true
    }

}
