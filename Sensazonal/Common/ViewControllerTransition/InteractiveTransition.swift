import UIKit

final class InteractiveTransition: UIPercentDrivenInteractiveTransition {

    var hasStarted = false
    var shouldFinish = false

    func endTransition() {
        if shouldFinish {
            finish()
        } else {
            cancel()
        }
    }

}
