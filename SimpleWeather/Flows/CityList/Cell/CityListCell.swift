//
//  CityListCell.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

import UIKit

// MARK: - Constants
fileprivate struct Consts {
    static let stackSpacing: CGFloat = 16
    static let cellInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
    static let stackInset: CGFloat = 20
    static let iconSize: CGFloat = 36
}

final class CityListCell: UITableViewCell {

    // MARK: - Private stored properties
    private let background = FactoryView.backgroundView
    private let iconView = FactoryView.iconView
    private let titleLabel = FactoryView.titleLabel
    private let temperatureLabel = FactoryView.temperatureLabel
    private let stackView = FactoryView.stackView
    private let activityView = FactoryView.activityIndicatorView
    private var isLoading = false {
        didSet {
            isLoading ? activityView.startAnimating() : activityView.stopAnimating()
        }
    }

    // MARK: - Internal methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
        configureSubviews()
    }

    required init?(coder: NSCoder) { return nil }

    override func prepareForReuse() {
        super.prepareForReuse()
        background.setGradient(with: .medium, axis: .horizontal)
        iconView.image = nil
        titleLabel.text = nil
        temperatureLabel.text = nil
        isLoading = false
    }

    func configure(cityName: String, isLoading: Bool) {
        self.titleLabel.text = cityName
        self.isLoading = isLoading
    }

    func configure(with viewData: CityListCellViewData) {
        iconView.image = viewData.iconImage
        temperatureLabel.text = viewData.temperature
        background.setGradient(with: viewData.gradientConfig, axis: .horizontal)
        isLoading = viewData.isLoading
    }

    // MARK: - Private methods
    private func addSubviews() {
        contentView.addSubview(background)
        background.addSubview(stackView)
        background.addSubview(activityView)
        stackView.addArrangedSubviews([iconView, titleLabel, temperatureLabel])
    }

    private func setupConstraints() {
        background.embed(in: contentView, insets: Consts.cellInsets)
        stackView.embed(in: background)
        iconView.heightAnchor.constraint(equalToConstant: Consts.iconSize).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: Consts.iconSize).isActive = true
        temperatureLabel.setContentHuggingPriority(.required, for: .horizontal)
        temperatureLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        activityView.translatesAutoresizingMaskIntoConstraints = false
        activityView.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 28).isActive = true
        activityView.centerYAnchor.constraint(equalTo: background.centerYAnchor).isActive = true
    }

    private func configureSubviews() {
        selectionStyle = .none
        backgroundColor = .clear
    }
}

extension CityListCell: Transformable {

    func transform(_ transform: Bool) {
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       options: [.curveEaseOut, .beginFromCurrentState],
                       animations: { [weak self] in self?.setViewAnimationState(transform) })
    }

    private func setViewAnimationState(_ pressed: Bool) {
        transform = pressed ? CGAffineTransform(scaleX: 0.9, y: 0.9) : .identity
    }
}

fileprivate struct FactoryView {
    static var backgroundView: GradientView {
        let backgroundView = GradientView()
        backgroundView.setGradient(with: .medium, axis: .horizontal)
        backgroundView.layer.cornerRadius = 7
        backgroundView.layer.masksToBounds = true
        return backgroundView
    }

    static var stackView: UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = Consts.stackSpacing
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(all: Consts.stackInset)
        return stack
    }

    static var iconView: UIImageView {
        let iconView = UIImageView()
        return iconView
    }

    static var titleLabel: UILabel {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .custom(.latoRegular, size: 24)
        label.textColor = .white
        return label
    }

    static var temperatureLabel: UILabel {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .custom(.latoRegular, size: 34)
        label.textColor = .white
        return label
    }

    static var activityIndicatorView: UIActivityIndicatorView {
        let activityView = UIActivityIndicatorView(style: .medium)
        activityView.hidesWhenStopped = true
        activityView.color = .white
        activityView.startAnimating()
        return activityView
    }
}
