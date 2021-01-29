//
//  CityDetailsViewData.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 28/01/2021.
//

struct CityDetailsViewData: Equatable {
    let icon: WeatherIcon
    let temperature: String?
    let cityName: String
    let condition: String
    let feelsLike: String?
    let highTemperature: String?
    let lowTemperature: String?
}
