import UIKit

class MonthSelectorBarButton: UIBarButtonItem {

    private let selectAction: () -> Void

    init(action: @escaping () -> Void) {
        self.selectAction = action
        super.init()
        image = #imageLiteral(resourceName: "top/filter")
        self.action = #selector(executeSelectAction)
    }

    required init?(coder aDecoder: NSCoder) { Logger.shared.notImplemented(); return nil }

    @objc private func executeSelectAction() {
        selectAction()
    }

}
