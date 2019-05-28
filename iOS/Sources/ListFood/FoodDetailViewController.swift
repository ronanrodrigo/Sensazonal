//
//  FoodDetailViewController.swift
//  iOS
//
//  Created by Ronan Nunes on 09/09/19.
//  Copyright © 2019 Ronan Nunes. All rights reserved.
//

import UIKit

protocol FoodDetailViewControllable {
    func bind(viewModel: FoodViewModel)
}

class FoodDetailViewController: UIViewController, FoodDetailViewControllable {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func bind(viewModel: FoodViewModel) {
        title = viewModel.name
    }

}
