//
//  WeatherDataList.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

struct WeatherResponse: Decodable, Equatable {
    let list: [WeatherData]
    let city: CityInfo
}
