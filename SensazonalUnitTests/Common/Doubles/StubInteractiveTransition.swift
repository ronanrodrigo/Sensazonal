@testable import Sensazonal

class StubInteractiveTransition: InteractiveTransition {
    var didCalCancel = false
    var didCallFinish = false

    override func finish() {
        didCallFinish = true
    }

    override func cancel() {
        didCalCancel = true
    }
}
