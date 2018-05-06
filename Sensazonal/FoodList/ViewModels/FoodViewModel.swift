import UIKit

struct FoodViewModel {

    let name: String
    let nameColor: UIColor
    let nameBackgroundGradient: CAGradientLayer
    let photo: UIImage

    init(name: String, nameColor: UIColor, nameBackgroundColor: UIColor, photo: UIImage) {
        self.name = name
        self.nameColor = nameColor
        self.nameBackgroundGradient = CAGradientLayer(startColor: nameBackgroundColor)
        self.photo = photo
    }

}
