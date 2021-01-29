//
//  UIFont+Extension.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

import UIKit

enum CustomFont: String {
    case latoRegular = "Lato-Regular"
    case latoSemibold = "Lato-Semibold"
    case latoBold = "Lato-Bold"
}

extension UIFont {
    static func custom(_ font: CustomFont, size: CGFloat) -> UIFont {
        return UIFont(name: font.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
}
