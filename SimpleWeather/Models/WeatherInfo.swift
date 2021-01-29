//
//  WeatherInfo.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

import Foundation

struct WeatherInfo: Decodable, Equatable {
    let main: String
    let description: String
    let icon: WeatherIcon
}
