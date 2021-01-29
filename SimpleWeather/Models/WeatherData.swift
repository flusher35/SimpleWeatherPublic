//
//  WeatherData.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

struct WeatherData: Decodable, Equatable {
    let mainValues: WeatherValues
    let weatherInfo: [WeatherInfo]

    enum CodingKeys: String, CodingKey {
        case mainValues = "main"
        case weatherInfo = "weather"
    }
}
