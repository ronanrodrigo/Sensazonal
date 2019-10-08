//
//  ListFoodCollectionViewCell.swift
//  iOS
//
//  Created by Ronan Nunes on 08/10/19.
//  Copyright © 2019 Ronan Nunes. All rights reserved.
//

import UIKit

class ListFoodCollectionViewCell: UICollectionViewCell {

    static var reuseIdentifier = String(describing: ListFoodCollectionViewCell.self)
    @IBOutlet weak var content: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var picture: UIImageView!

}
