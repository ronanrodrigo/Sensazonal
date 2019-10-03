import WatchKit

final class FoodGroupRowController: NSObject {
    static var rowType = String(describing: FoodGroupRowController.self)
    @IBOutlet weak var nameLabel: WKInterfaceLabel!
}
