//
//  ListFoodCollectionViewController.swift
//  iOS
//
//  Created by Ronan Nunes on 08/10/19.
//  Copyright © 2019 Ronan Nunes. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ListFoodCollectionViewController: UICollectionViewController {

    private var cellIdentifier: String = String(describing: ListFoodCollectionViewController.self) + "Cell"
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private var viewModel = ListFoodViewModel.empty
    private var groupedFoodViewModels: [GroupedFoodViewModel] { return viewModel.groupedFoodViewModels }
    @IBOutlet var dependency: ListFoodViewControllerDependency! {
        didSet {
            dependency.presenter.bindable = self
            dependency.interactor.list()
        }
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return groupedFoodViewModels.count
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let group = groupedFoodViewModels[section]
        return group.foods.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        cell.backgroundColor = .orange
        return cell
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
