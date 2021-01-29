//
//  CityListCellViewData.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

import UIKit

struct CityListCellViewData: Equatable {
    let iconImage: UIImage?
    let temperature: String?
    let gradientConfig: GradientConfig
    let isLoading: Bool

    init(from weatherData: WeatherData? = nil, units: Units, isLoading: Bool) {
        iconImage = weatherData?.weatherInfo.first?.icon.uiImage
        temperature = TextFormatter.formatTemperature(weatherData?.mainValues.temp, units: units)
        gradientConfig = GradientConfig(from: weatherData?.mainValues.temp)
        self.isLoading = isLoading
    }
}
