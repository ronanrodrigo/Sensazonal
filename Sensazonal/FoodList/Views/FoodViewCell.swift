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
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = Metric.extraSmall
        return imageView
    }()

    private let name: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()

    private let footer: UIView = {
        let view = UIView()
        return view
    }()

    private let favorite: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "Action/HeartOutline"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(didTouchAtFavorite), for: .touchUpInside)
        return button
    }()

    private var favoritateAction: () -> Void = {}

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        installSubviews()
        installConstraints()
        installFavoriteAction()
    }

    required init?(coder aDecoder: NSCoder) { Logger.shared.notImplemented(); return nil }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: content.layer.cornerRadius).cgPath
    }

    func bind(viewModel: FoodViewModel) {
        photo.image = viewModel.photo
        name.text = viewModel.name
        name.textColor = UIColor.black.withAlphaComponent(0.7)
        footer.backgroundColor = .white
        favorite.setImage(viewModel.favoriteImage, for: .normal)
    }

    func addFavoriteAction(action: @escaping () -> Void) {
        favoritateAction = action
    }

    private func installSubviews() {
        addSubview(content)
        content.addSubview(photo)
        content.addSubview(footer)
        footer.addSubview(name)
        footer.addSubview(favorite)
        installShadow()
    }

    private func installConstraints() {
        installContentConstraints()
        installPhotoConstraints()
        installNameBackgroundConstraints()
        installNameConstraints()
        installFavoriteButtonConstraints()
    }

    private func installShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 1.2
        layer.shadowOpacity = 0.2
        layer.masksToBounds = false
    }

    private func installContentConstraints() {
        content.edgesEqualTo(self)
    }

    private func installPhotoConstraints() {
        LayoutConstraint.activate([
            photo.heightAnchor.constraint(equalTo: content.heightAnchor),
            photo.leadingAnchor.constraint(equalTo: content.leadingAnchor),
            photo.trailingAnchor.constraint(equalTo: content.trailingAnchor)
        ])
    }

    private func installNameBackgroundConstraints() {
        LayoutConstraint.activate([
            footer.leadingAnchor.constraint(equalTo: content.leadingAnchor),
            footer.trailingAnchor.constraint(equalTo: content.trailingAnchor),
            footer.bottomAnchor.constraint(equalTo: content.bottomAnchor),
            footer.topAnchor.constraint(equalTo: photo.bottomAnchor)
        ])
    }

    private func installNameConstraints() {
        LayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: footer.leadingAnchor, constant: Metric.small),
            name.topAnchor.constraint(equalTo: footer.topAnchor, constant: Metric.small),
            name.trailingAnchor.constraint(equalTo: favorite.leadingAnchor, constant: -Metric.small),
            name.bottomAnchor.constraint(equalTo: footer.bottomAnchor, constant: -Metric.small)
        ])
    }

    private func installFavoriteButtonConstraints() {
        LayoutConstraint.activate([
            favorite.widthAnchor.constraint(equalToConstant: Metric.large),
            favorite.centerYAnchor.constraint(equalTo: name.centerYAnchor),
            favorite.trailingAnchor.constraint(equalTo: footer.trailingAnchor, constant: -Metric.small)
        ])
    }

    private func installFavoriteAction() {
        favorite.addTarget(self, action: #selector(didTouchAtFavorite), for: .touchUpInside)
    }

    @objc private func didTouchAtFavorite() {
        favoritateAction()
    }

}
