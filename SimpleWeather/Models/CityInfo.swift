//
//  CityInfo.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

import Foundation

struct CityInfo: Decodable, Equatable {
    let name: String
    let timeZone: TimeInterval

    enum CodingKeys: String, CodingKey {
        case name
        case timeZone = "timezone"
    }
}
