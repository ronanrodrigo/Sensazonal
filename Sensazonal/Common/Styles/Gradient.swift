import UIKit

extension CAGradientLayer {

    convenience init(startColor: UIColor) {
        self.init()
        let finalColor = startColor.withAlphaComponent(0).cgColor
        colors = [finalColor, startColor.cgColor]
    }

}
