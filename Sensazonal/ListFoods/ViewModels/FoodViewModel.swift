import UIKit

struct FoodViewModel {

    let name: String
    let nameColor: UIColor
    let nameBackgroundGradient: CAGradientLayer
    let photo: UIImage

    init(name: String, nameColor: UIColor, nameBackgroundColor: UIColor, photo: UIImage) {
        self.name = name
        self.nameColor = nameColor
        self.nameBackgroundGradient = FoodViewModel.makeGradient(startColor: nameBackgroundColor)
        self.photo = photo
    }

    private static func makeGradient(startColor: UIColor) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        let finalColor = startColor.withAlphaComponent(0).cgColor

        gradientLayer.colors = [finalColor, startColor.cgColor]

        return gradientLayer
    }

}
