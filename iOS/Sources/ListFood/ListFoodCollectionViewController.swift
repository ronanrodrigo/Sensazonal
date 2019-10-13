import UIKit

class ListFoodCollectionViewController: UICollectionViewController {

    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let itemsPerRow: CGFloat = 2
    private var viewModel = ListFoodViewModel.empty
    private var groupedFoodViewModels: [GroupedFoodViewModel] { return viewModel.groupedFoodViewModels }
    @IBOutlet var dependency: ListFoodViewControllerDependency! {
        didSet {
            dependency.presenter.bindable = self
            dependency.interactor.list()
        }
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionViewLayout.invalidateLayout()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return groupedFoodViewModels.count
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let group = groupedFoodViewModels[section]
        return group.foods.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListFoodCollectionViewCell.reuseIdentifier, for: indexPath)
        guard let foodCell = cell as? ListFoodCollectionViewCell else {
            return cell
        }
        let group = groupedFoodViewModels[indexPath.section]
        foodCell.title.text = group.foods[indexPath.row].name
        foodCell.background.backgroundColor = group.foods[indexPath.row].color
        return foodCell
    }

}

extension ListFoodCollectionViewController: ListFoodTableViewControllerBind {

    func bind(viewModel: ListFoodViewModel) {
        self.viewModel = viewModel
        title = viewModel.title
        collectionView.reloadData()
    }

    func bind(errorViewModel: ListFoodErrorViewModel) {
    }

}

extension ListFoodCollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let width = availableWidth / itemsPerRow
        let height = width / 2

        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }

}
