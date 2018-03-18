import UIKit

final class FoodViewCell: UICollectionViewCell {

    static let identifier = String(describing: FoodViewCell.self)

    private var nameBackgroundGradient = CAGradientLayer()

    private let content: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 4
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
        label.font = UIFont.boldSystemFont(ofSize: 12)
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

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        installSubviews()
        installConstraints()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        nameBackgroundGradient.frame = bounds
        nameBackground.layer.addSublayer(nameBackgroundGradient)
    }

    func bind(viewModel: FoodViewModel) {
        photo.image = viewModel.photo
        name.text = viewModel.name
        name.textColor = viewModel.nameColor
        nameBackgroundGradient = viewModel.nameBackgroundGradient
    }

    private func installSubviews() {
        addSubview(content)
        content.addSubview(photo)
        content.addSubview(nameBackground)
        content.addSubview(name)
    }

    private func installConstraints() {
        content.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        content.topAnchor.constraint(equalTo: topAnchor).isActive = true
        content.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        content.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        photo.leadingAnchor.constraint(equalTo: content.leadingAnchor).isActive = true
        photo.topAnchor.constraint(equalTo: content.topAnchor).isActive = true
        photo.trailingAnchor.constraint(equalTo: content.trailingAnchor).isActive = true
        photo.bottomAnchor.constraint(equalTo: content.bottomAnchor).isActive = true

        nameBackground.leadingAnchor.constraint(equalTo: content.leadingAnchor).isActive = true
        nameBackground.trailingAnchor.constraint(equalTo: content.trailingAnchor).isActive = true
        nameBackground.bottomAnchor.constraint(equalTo: content.bottomAnchor).isActive = true
        nameBackground.heightAnchor.constraint(equalTo: content.heightAnchor, multiplier: 0.7).isActive = true

        name.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 8).isActive = true
        name.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -8).isActive = true
        name.bottomAnchor.constraint(equalTo: content.bottomAnchor, constant: -8).isActive = true
    }

}
