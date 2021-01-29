//
//  GradientView.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

import UIKit

class GradientView: UIView {

    // MARK: - Private stored properties
    private let gradient = CAGradientLayer()

    // MARK: - Internal methods
    init(colors: [UIColor] = [],
         locations: [NSNumber] = [0, 1],
         startPoint: CGPoint = CGPoint(x: 0, y: 0),
         endPoint: CGPoint = CGPoint(x: 0, y: 1)) {
        super.init(frame: .zero)
        setGradient(colors: colors, locations: locations, startPoint: startPoint, endPoint: endPoint)
        layer.addSublayer(gradient)
    }

    required init?(coder: NSCoder) { return nil }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = bounds
    }

    func setGradient(colors: [UIColor],
                     locations: [NSNumber] = [0, 1],
                     startPoint: CGPoint = CGPoint(x: 0, y: 0),
                     endPoint: CGPoint = CGPoint(x: 0, y: 1)) {
        gradient.colors = colors.map { $0.cgColor }
        gradient.locations = locations
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
    }

    func setGradient(with config: GradientConfig, axis: NSLayoutConstraint.Axis) {
        let startPoint = CGPoint(x: 0, y: 0)
        let endPoint = CGPoint(x: axis == .horizontal ? 1 : 0, y: axis == .horizontal ? 0 : 1)
        setGradient(colors: config.colors, startPoint: startPoint, endPoint: endPoint)
    }
}
