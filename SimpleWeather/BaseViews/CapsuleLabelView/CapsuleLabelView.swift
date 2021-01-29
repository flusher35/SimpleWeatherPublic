//
//  CapsuleLabelView.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 28/01/2021.
//

import UIKit

class CapsuleLabelView: UIView {

    // MARK: - Internal properties
    var text: String? {
        didSet {
            label.text = text
        }
    }

    var textFont: UIFont? {
        didSet {
            label.font = textFont
        }
    }

    var textColor: UIColor? {
        didSet {
            label.textColor = textColor
        }
    }

    var capsuleColor: UIColor? {
        didSet {
            backgroundView.backgroundColor = capsuleColor
        }
    }

    // MARK: - Private stored properties
    private let backgroundView = FactoryView.backgroundView
    private let label = FactoryView.label

    // MARK: - Internal methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
        configureSubviews()
    }

    required init?(coder: NSCoder) { return nil }

    // MARK: - Private methods
    private func addSubviews() {
        addSubviews([backgroundView, label])
    }

    private func setupConstraints() {
        backgroundView.embed(in: self)
        label.embed(in: backgroundView, insets: UIEdgeInsets(vertical: 7, horizontal: 16))
    }

    private func configureSubviews() {
        backgroundColor = .clear
    }
}

fileprivate struct FactoryView {
    static var backgroundView: UIView {
        let backgroundView = UIView()
        backgroundView.layer.masksToBounds = true
        backgroundView.layer.cornerRadius = 15
        return backgroundView
    }

    static var label: UILabel {
        let label = UILabel()
        return label
    }
}
