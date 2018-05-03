import UIKit

class MonthSelectorBarButton: UIBarButtonItem {

    private let selectAction: () -> Void

    init(selectAction: @escaping () -> Void) {
        self.selectAction = selectAction
        super.init()
        image = #imageLiteral(resourceName: "top/filter")
        action = #selector(executeSelectAction)
    }

    required init?(coder aDecoder: NSCoder) { Logger.shared.notImplemented(); return nil }

    @objc private func executeSelectAction() {
        selectAction()
    }

}
