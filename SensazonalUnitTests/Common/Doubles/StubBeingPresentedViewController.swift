import UIKit

class StubBeingPresentedViewController: UIViewController {
    override var isBeingPresented: Bool { return stubIsBeingPresented }
    private let stubIsBeingPresented: Bool

    init(isBeingPresented: Bool) {
        self.stubIsBeingPresented = isBeingPresented
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
