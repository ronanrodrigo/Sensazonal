import UIKit

final class FoodViewCell: UICollectionViewCell {

    private let content: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = Metric.extraSmall
        return view
    }()

    private let photo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: Metric.large)
        return label
    }()

    private let nameBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        installSubviews()
        installConstraints()
    }

    required init?(coder aDecoder: NSCoder) { Logger.shared.notImplemented(); return nil }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    func bind(viewModel: FoodViewModel) {
        photo.image = viewModel.photo
        name.text = viewModel.name
        name.textColor = .white
        nameBackground.backgroundColor = UIColor.black.withAlphaComponent(0.7)
    }

    private func installSubviews() {
        addSubview(content)
        content.addSubview(photo)
        content.addSubview(nameBackground)
        nameBackground.addSubview(name)
    }

    private func installConstraints() {
        installContentConstraints()
        installPhotoConstraints()
        installNameBackgroundConstraints()
        installNameConstraints()
    }

    private func installContentConstraints() {
        NSLayoutConstraint.activate([
            content.leadingAnchor.constraint(equalTo: leadingAnchor),
            content.topAnchor.constraint(equalTo: topAnchor),
            content.trailingAnchor.constraint(equalTo: trailingAnchor),
            content.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func installPhotoConstraints() {
        NSLayoutConstraint.activate([
            photo.leadingAnchor.constraint(equalTo: content.leadingAnchor),
            photo.topAnchor.constraint(equalTo: content.topAnchor),
            photo.trailingAnchor.constraint(equalTo: content.trailingAnchor),
            photo.bottomAnchor.constraint(equalTo: content.bottomAnchor)
        ])
    }

    private func installNameBackgroundConstraints() {
        NSLayoutConstraint.activate([
            nameBackground.leadingAnchor.constraint(equalTo: content.leadingAnchor),
            nameBackground.trailingAnchor.constraint(equalTo: content.trailingAnchor),
            nameBackground.bottomAnchor.constraint(equalTo: content.bottomAnchor)
        ])
    }

    private func installNameConstraints() {
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: nameBackground.topAnchor, constant: Metric.small),
            name.leadingAnchor.constraint(equalTo: nameBackground.leadingAnchor, constant: Metric.small),
            name.trailingAnchor.constraint(equalTo: nameBackground.trailingAnchor, constant: -Metric.small),
            name.bottomAnchor.constraint(equalTo: nameBackground.bottomAnchor, constant: -Metric.small)
        ])
    }

}
