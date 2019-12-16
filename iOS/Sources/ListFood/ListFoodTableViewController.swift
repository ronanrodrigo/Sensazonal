import Core
import Share
import UIKit

// sourcery: AutoMock
protocol ListFoodBind: AnyObject {
    func bind(viewModel: ListFoodViewModel)
    func bind(errorViewModel: ListFoodErrorViewModel)
}

class ListFoodTableViewController: UITableViewController {

    @IBOutlet var dependency: ListFoodViewControllerDependency! {
        didSet {
            dependency.presenter.binder = self
            dependency.interactor.list()
        }
    }

    private var cellIdentifier: String = String(describing: ListFoodTableViewController.self)
    private var viewModel = ListFoodViewModel.empty
    private var groupedFoodViewModels: [GroupedFoodViewModel] { return viewModel.groupedFoodViewModels }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return groupedFoodViewModels.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return groupedFoodViewModels[section].group
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let group = groupedFoodViewModels[section]
        return group.foods.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let group = groupedFoodViewModels[indexPath.section]
        let food = group.foods[indexPath.row]
        cell.textLabel?.text = food.name
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.prepareFoodDetail(tableView.indexPathForSelectedRow) { selectedItem in
            let group = groupedFoodViewModels[selectedItem.section]
            return group.foods[selectedItem.row]
        }
    }
}

extension ListFoodTableViewController: ListFoodBind {

    func bind(viewModel: ListFoodViewModel) {
        self.viewModel = viewModel
        title = viewModel.title
        tableView.reloadData()
    }

    func bind(errorViewModel: ListFoodErrorViewModel) {
        let alertController = UIAlertController(title: errorViewModel.title,
                                                message: errorViewModel.message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: localize("Ok"), style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }

}
