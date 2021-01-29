//
//  WeatherValues.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

struct WeatherValues: Decodable, Equatable {
    let temp: Double
    let pressure: Double
    let humidity: Int
    let tempMin: Double
    let tempMax: Double
    let feelsLike: Double

    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case feelsLike = "feels_like"
    }
}
