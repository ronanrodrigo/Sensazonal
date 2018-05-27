import UIKit

class InteractiveTransition: UIPercentDrivenInteractiveTransition {

    var hasStarted = false
    var shouldFinish = false

    func endTransition() {
        guard shouldFinish else { return cancel() }
        return finish()
    }

}
