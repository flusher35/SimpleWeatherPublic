//
//  UIView+Extension.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

import UIKit

extension UIView {

    func embed(in view: UIView, insets: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insets.right).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom).isActive = true
    }

    func addSubviews(_ views: [UIView]) {
        views.forEach({ addSubview($0) })
    }
}
