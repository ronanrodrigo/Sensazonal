import UIKit
@testable import Sensazonal

public final class StubPanGesture: UIPanGestureRecognizer {

    private let superView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
    private let panView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
    private let translationPoint: Int
    public override var view: UIView? { return panView }

    public init(state: UIGestureRecognizer.State = .began, translationPoint: Int = 0) {
        self.translationPoint = translationPoint
        super.init(target: nil, action: nil)
        superView.addSubview(panView)
        self.state = .began
    }

    public override func translation(in view: UIView?) -> CGPoint {
        return CGPoint(x: 0, y: translationPoint)
    }
}
