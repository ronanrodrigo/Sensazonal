import UIKit

typealias TouchAction = () -> Void

class MonthSelectorBarButton: UIBarButtonItem {

    private let firstAction: TouchAction
    private let secondAction: TouchAction

    init(firstAction: @escaping TouchAction, secondAction: @escaping TouchAction) {
        self.firstAction = firstAction
        self.secondAction = secondAction
        super.init()
        image = #imageLiteral(resourceName: "top/filter")
        action = #selector(executeFirstAction)
    }

    required init?(coder aDecoder: NSCoder) { Logger.shared.notImplemented(); return nil }

    @objc private func executeFirstAction() {
        firstAction()
        action = #selector(executeSecondAction)
    }

    @objc private func executeSecondAction() {
        secondAction()
        action = #selector(executeFirstAction)
    }

}
