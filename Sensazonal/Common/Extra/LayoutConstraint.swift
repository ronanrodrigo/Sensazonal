import UIKit

final class LayoutConstraint: NSLayoutConstraint {
    override class func activate(_ constraints: [NSLayoutConstraint]) {
        constraints
            .compactMap { $0.firstItem as? UIView }
            .forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        super.activate(constraints)
    }
}
