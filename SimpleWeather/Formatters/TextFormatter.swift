//
//  Formatter.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

import Foundation

class TextFormatter {

    private init() {}

    static func formatTemperature(_ temp: Double?, units: Units, prefix: String? = nil) -> String? {
        guard let temp = temp else { return nil }
        let intTemp = Int(temp)
        var tempString = (prefix ?? "") + (intTemp > 0 ? String("+\(intTemp)") : String(intTemp))
        switch units {
        case .imperial:
            tempString.append(contentsOf: "°F")
        case .metric:
            tempString.append(contentsOf: "°C")
        }
        return tempString
    }
}
