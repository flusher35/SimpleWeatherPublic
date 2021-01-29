//
//  GradientConfig.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

import UIKit

enum GradientConfig {
    case dark
    case medium
    case light

    // MARK: - Internal methods
    init(from value: Double?) {
        if let value = value {
            switch value {
            case let value where value < 0: self = .dark
            case let value where value > 15: self = .light
            default: self = .medium
            }
        } else {
            self = .medium
        }
    }

    // MARK: - Internal computed properties
    var colors: [UIColor] {
        switch self {
        case .dark: return [.darkBlue, .seaBlue]
        case .medium: return [.turquoise, .lightBlue]
        case .light: return [.lightTurquoise, .boldBlue]
        }
    }
}
