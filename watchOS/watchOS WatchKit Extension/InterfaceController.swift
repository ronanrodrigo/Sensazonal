import WatchKit
import Foundation
import Core
import Share

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var titleLabel: WKInterfaceLabel!
    @IBOutlet weak var foodListTable: WKInterfaceTable!
    private lazy var interactor = ListFoodInteractorFactory.make(presenter: self)

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        interactor.list()
    }

}

extension InterfaceController: ListFoodPresenter {
    func present(groupedFoods: [GroupedFoods], month: Month) {
        titleLabel.setText(month.name)
        setTitle("Foods")
        groupedFoods
            .flatMap { groupedFood -> [(name: String, isGroup: Bool)] in
                let foodNames = groupedFood.foods.map { ($0.name, false) }
                return [(groupedFood.name, true)] + foodNames
        }
        .enumerated()
        .forEach { (index, item) in
            if item.isGroup {
                foodListTable.insertRows(at: IndexSet(index...index), withRowType: FoodGroupRowController.rowType)
                let row = foodListTable.rowController(at: index) as? FoodGroupRowController
                row?.nameLabel.setText(item.name)
            } else {
                foodListTable.insertRows(at: IndexSet(index...index), withRowType: FoodRowController.rowType)
                let row = foodListTable.rowController(at: index) as? FoodRowController
                row?.nameLabel.setText(item.name)
            }
        }
    }

    func present(error: ListFoodError) {
    }
}
