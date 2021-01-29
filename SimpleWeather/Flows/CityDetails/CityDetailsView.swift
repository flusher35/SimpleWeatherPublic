//
//  CityDetailsView.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

import UIKit

final class CityDetailsView: UIView {

    // MARK: - Internal stored properties
    let backButton = FactoryView.backButton

    // MARK: - Private stored properties
    private let backgroundView = FactoryView.backgroundView
    private let mainStack = FactoryView.mainStack
    private let iconAndTemperatureStack = FactoryView.iconAndTemperatureStack
    private let cityAndConditionStack = FactoryView.cityAndConditionStack
    private let feelsLikeContainerStack = FactoryView.feelsLikeContainerStack
    private let highLowTemperaturesContainerStack = FactoryView.highLowTemperaturesContainerStack
    private let highLowTemperaturesStack = FactoryView.highLowTemperaturesStack
    private let iconView = FactoryView.iconView
    private let temperatureLabel = FactoryView.temperatureLabel
    private let cityLabel = FactoryView.cityLabel
    private let conditionLabel = FactoryView.conditionLabel
    private let feelsLikeLabel = FactoryView.feelsLikeView
    private let highTemperature = FactoryView.highTemperature
    private let lowTemperature = FactoryView.lowTemperature

    // MARK: - Internal methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
        configureSubviews()
    }

    required init?(coder: NSCoder) { return nil }

    func update(with viewData: CityDetailsViewData) {
        iconView.image = viewData.icon.uiImage
        cityLabel.text = viewData.cityName
        temperatureLabel.text = viewData.temperature
        conditionLabel.text = viewData.condition
        feelsLikeLabel.text = viewData.feelsLike
        highTemperature.text = viewData.highTemperature
        lowTemperature.text = viewData.lowTemperature
    }

    // MARK: - Private methods
    private func addSubviews() {
        addSubviews([backgroundView, backButton, mainStack])
        mainStack.addArrangedSubviews([iconAndTemperatureStack, cityAndConditionStack, feelsLikeContainerStack, highLowTemperaturesContainerStack])
        feelsLikeContainerStack.addArrangedSubview(feelsLikeLabel)
        highLowTemperaturesContainerStack.addArrangedSubview(highLowTemperaturesStack)
        iconAndTemperatureStack.addArrangedSubviews([iconView, UIView(), temperatureLabel])
        cityAndConditionStack.addArrangedSubviews([cityLabel, conditionLabel])
        highLowTemperaturesStack.addArrangedSubviews([highTemperature, lowTemperature])
        iconView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 36).isActive = true
    }

    private func setupConstraints() {
        backgroundView.embed(in: self)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: 32).isActive = true
        mainStack.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        mainStack.widthAnchor.constraint(lessThanOrEqualTo: backgroundView.widthAnchor, multiplier: 0.7).isActive = true
        mainStack.widthAnchor.constraint(greaterThanOrEqualToConstant: 250).isActive = true
    }

    private func configureSubviews() {
        mainStack.layer.borderWidth = 1.5
        mainStack.layer.borderColor = UIColor.white.cgColor
        mainStack.layer.masksToBounds = true
        mainStack.layer.cornerRadius = 7
    }
}

fileprivate struct FactoryView {
    static var backgroundView: UIView {
        let backgroundView = GradientView(colors: [.darkBlue, .boldBlue, .lightTurquoise],
                                          locations: [0, 0.2, 1])
        return backgroundView
    }

    static var backButton: UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: "back-button"), for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(all: 20)
        return button
    }

    static var mainStack: UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 20
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(all: 20)
        return stack
    }

    static var iconAndTemperatureStack: UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 6
        return stack
    }

    static var cityAndConditionStack: UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 6
        return stack
    }

    static var feelsLikeContainerStack: UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        return stack
    }

    static var highLowTemperaturesContainerStack: UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        return stack
    }

    static var highLowTemperaturesStack: UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 12
        return stack
    }

    static var iconView: UIImageView {
        let iconView = UIImageView()
        return iconView
    }

    static var temperatureLabel: UILabel {
        let label = UILabel()
        label.textColor = .white
        label.font = .custom(.latoRegular, size: 34)
        return label
    }

    static var cityLabel: UILabel {
        let label = UILabel()
        label.textColor = .white
        label.font = .custom(.latoRegular, size: 24)
        return label
    }

    static var conditionLabel: UILabel {
        let label = UILabel()
        label.textColor = .white
        label.font = .custom(.latoRegular, size: 15)
        return label
    }

    static var feelsLikeView: CapsuleLabelView {
        let capsuleLabelView = CapsuleLabelView()
        capsuleLabelView.textColor = .white
        capsuleLabelView.textFont = .custom(.latoSemibold, size: 15)
        capsuleLabelView.capsuleColor = .deepBlue
        return capsuleLabelView
    }

    static var highTemperature: UILabel {
        let label = UILabel()
        label.textColor = .white
        label.font = .custom(.latoBold, size: 15)
        return label
    }

    static var lowTemperature: UILabel {
        let label = UILabel()
        label.textColor = .white
        label.font = .custom(.latoBold, size: 15)
        return label
    }
}

