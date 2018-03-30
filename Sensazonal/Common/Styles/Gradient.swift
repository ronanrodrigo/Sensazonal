import UIKit

class Gradient {

    static func make(startColor: UIColor) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        let finalColor = startColor.withAlphaComponent(0).cgColor

        gradientLayer.colors = [finalColor, startColor.cgColor]

        return gradientLayer
    }

}
