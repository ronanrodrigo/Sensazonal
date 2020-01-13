import UIKit

class ListFoodCollectionViewCell: UICollectionViewCell {

    static var reuseIdentifier = String(describing: ListFoodCollectionViewCell.self)
    @IBOutlet weak var content: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var background: UIView!

}
