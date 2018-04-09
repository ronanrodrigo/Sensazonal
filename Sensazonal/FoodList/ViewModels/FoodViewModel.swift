import UIKit

/**
 Avoid long struct argument constructor.
 - Parameter name: food name.
 - Parameter nameColor: color to food name label.
 - Parameter nameBackgroundColor: background color behind food name label.
 - Parameter photo: food photo.
*/
typealias FoodViewModelParams = (name: String, nameColor: UIColor, nameBackgroundColor: UIColor, photo: UIImage)

struct FoodViewModel {

    let name: String
    let nameColor: UIColor
    let nameBackgroundGradient: CAGradientLayer
    let photo: UIImage

    init(_ params: FoodViewModelParams) {
        self.name = params.name
        self.nameColor = params.nameColor
        self.nameBackgroundGradient = Gradient.make(startColor: params.nameBackgroundColor)
        self.photo = params.photo
    }

}
