import UIKit

extension UIView {
    func edgesEqualTo(_ view: UIView, constant: CGFloat = 0) {
        LayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant),
            topAnchor.constraint(equalTo: view.topAnchor, constant: constant),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constant),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant)
        ])
    }
}
