import UIKit

final class FoodGroupView: UICollectionReusableView {
    static let identifier = String(describing: FoodGroupView.self)

    private let groupName: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: Metric.large)
        return label
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        installSubviews()
        installConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bind(group: FoodGroupViewModel) {
        groupName.text = group.name
    }

    private func installSubviews() {
        addSubview(groupName)
    }

    private func installConstraints() {
        NSLayoutConstraint.activate([
            groupName.leadingAnchor.constraint(equalTo: leadingAnchor),
            groupName.topAnchor.constraint(equalTo: topAnchor),
            groupName.trailingAnchor.constraint(equalTo: trailingAnchor),
            groupName.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }

}
