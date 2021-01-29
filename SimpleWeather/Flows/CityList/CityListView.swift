//
//  CityListView.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

import UIKit

// MARK: - Constants
fileprivate struct Consts {
    static let stackSpacing: CGFloat = 48
    static let stackInset: CGFloat = 20
}

final class CityListView: UIView {

    // MARK: - Internal stored properties
    let tableView = FactoryView.tableView

    // MARK: - Private stored properties
    private let backgroundView = FactoryView.backgroundView
    private let titleView = FactoryView.titleLabel

    // MARK: - Internal methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) { return nil }

    // MARK: - Private methods
    private func addSubviews() {
        addSubviews([backgroundView, titleView, tableView])
    }

    private func setupConstraints() {
        backgroundView.embed(in: self)
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        titleView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 32).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        let tableViewWidthConstraint = tableView.widthAnchor.constraint(equalTo: widthAnchor)
        tableViewWidthConstraint.priority = .defaultLow
        tableViewWidthConstraint.isActive = true
        tableView.widthAnchor.constraint(lessThanOrEqualToConstant: 500).isActive = true
    }
}

fileprivate struct FactoryView {
    static var backgroundView: UIView {
        let backgroundView = GradientView(colors: [.purpleDark, .purpleLight])
        return backgroundView
    }

    static var tableView: UITableView {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.alwaysBounceVertical = false
        tableView.delaysContentTouches = false
        tableView.backgroundColor = .clear
        return tableView
    }

    static var titleLabel: UILabel {
        let label = UILabel()
        label.text = "Cities Weather"
        label.textColor = .white
        label.font = .custom(.latoRegular, size: 18)
        return label
    }
}
