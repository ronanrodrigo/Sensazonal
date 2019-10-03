import WatchKit

final class FoodRowController: NSObject {
    static var rowType = String(describing: FoodRowController.self)
    @IBOutlet weak var nameLabel: WKInterfaceLabel!
}
