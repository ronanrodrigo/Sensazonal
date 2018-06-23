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

    private let nameBackground: UIView = {
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
        nameBackground.backgroundColor = .white
        favorite.setImage(viewModel.favoriteImage, for: .normal)
    }

    func addFavoriteAction(action: @escaping () -> Void) {
        favoritateAction = action
    }

    private func installSubviews() {
        addSubview(content)
        content.addSubview(nameBackground)
        content.addSubview(photo)
        nameBackground.addSubview(name)
        nameBackground.addSubview(favorite)
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
            photo.leadingAnchor.constraint(equalTo: content.leadingAnchor),
            photo.topAnchor.constraint(equalTo: content.topAnchor),
            photo.trailingAnchor.constraint(equalTo: content.trailingAnchor),
            photo.bottomAnchor.constraint(equalTo: nameBackground.topAnchor, constant: Metric.small)
        ])
    }

    private func installNameBackgroundConstraints() {
        LayoutConstraint.activate([
            nameBackground.leadingAnchor.constraint(equalTo: content.leadingAnchor),
            nameBackground.trailingAnchor.constraint(equalTo: content.trailingAnchor),
            nameBackground.bottomAnchor.constraint(equalTo: content.bottomAnchor)
        ])
    }

    private func installNameConstraints() {
        LayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: nameBackground.leadingAnchor, constant: Metric.small),
            name.topAnchor.constraint(equalTo: nameBackground.topAnchor, constant: Metric.large),
            name.trailingAnchor.constraint(equalTo: favorite.leadingAnchor, constant: -Metric.small),
            name.bottomAnchor.constraint(equalTo: nameBackground.bottomAnchor, constant: -Metric.small)
        ])
    }

    private func installFavoriteButtonConstraints() {
        LayoutConstraint.activate([
            favorite.widthAnchor.constraint(equalToConstant: Metric.large),
            favorite.centerYAnchor.constraint(equalTo: name.centerYAnchor),
            favorite.trailingAnchor.constraint(equalTo: nameBackground.trailingAnchor, constant: -Metric.small)
        ])
    }

    private func installFavoriteAction() {
        favorite.addTarget(self, action: #selector(didTouchAtFavorite), for: .touchUpInside)
    }

    @objc private func didTouchAtFavorite() {
        favoritateAction()
    }

}
