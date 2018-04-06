import UIKit

class MonthSelectorBarButton: UIBarButtonItem {

    private let onTouch: () -> Void

    init(onTouch: @escaping () -> Void) {
        self.onTouch = onTouch
        super.init()
        image = #imageLiteral(resourceName: "top/filter")
        action = #selector(didTouchAtMonthSelectorButton)
    }

    required init?(coder aDecoder: NSCoder) { Logger.shared.notImplemented(#file, #function, #line); return nil }

    @objc private func didTouchAtMonthSelectorButton() {
        onTouch()
    }

}
