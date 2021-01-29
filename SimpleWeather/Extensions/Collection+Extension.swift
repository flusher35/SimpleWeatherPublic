//
//  Collection+Extension.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
