//
//  UIEdgeInsets+Extension.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

import UIKit

extension UIEdgeInsets {
    init(vertical: CGFloat = 0, horizontal: CGFloat = 0) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }

    init(all: CGFloat) {
        self.init(top: all, left: all, bottom: all, right: all)
    }
}
