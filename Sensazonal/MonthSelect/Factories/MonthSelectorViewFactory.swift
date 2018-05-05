import UIKit

struct MonthSelectorViewFactory {

    static func make(dataProvider: MonthSelectorDataProvider, action: @escaping () -> Void) -> MonthSelectorView {
        let picker = MonthPicker(dataProvider: dataProvider, finishAction: action)
        return picker
    }

}
