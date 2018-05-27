import UIKit
@testable import Sensazonal

public final class StubPanGesture: UIPanGestureRecognizer {

    private var customState: UIGestureRecognizerState
    private let superView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
    private let panView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
    private let translationPoint: Int
    public override var state: UIGestureRecognizerState { return customState }
    public override var view: UIView? { return panView }

    public init(customState: UIGestureRecognizerState, translationPoint: Int = 0) {
        self.customState = customState
        self.translationPoint = translationPoint
        super.init(target: nil, action: nil)
        superView.addSubview(panView)
    }

    public override func translation(in view: UIView?) -> CGPoint {
        return CGPoint(x: 0, y: translationPoint)
    }
}
