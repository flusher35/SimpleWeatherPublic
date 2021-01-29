//
//  CityDetailsViewModel.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

protocol CityDetailsViewModelDelegate: AnyObject {
    func update(with viewData: CityDetailsViewData)
}

class CityDetailsViewModel {

    // MARK: - Private stored properties
    private let weather: WeatherResponse
    private let units: Units
    private weak var delegate: CityDetailsViewModelDelegate?

    // MARK: - Internal methods
    init(weather: WeatherResponse, units: Units = .metric) {
        self.weather = weather
        self.units = units
    }

    func attach(delegate: CityDetailsViewModelDelegate) {
        self.delegate = delegate
        guard let viewData = createViewData() else { return }
        delegate.update(with: viewData)
    }

    private func createViewData() -> CityDetailsViewData? {
        guard let weatherData = weather.list.first,
              let weatherInfo = weatherData.weatherInfo.first else { return nil }
        let cityName = weather.city.name
        return CityDetailsViewData(icon: weatherInfo.icon,
                                   temperature: TextFormatter.formatTemperature(weatherData.mainValues.temp, units: units),
                                   cityName: cityName,
                                   condition: weatherInfo.main,
                                   feelsLike: TextFormatter.formatTemperature(weatherData.mainValues.feelsLike, units: units, prefix: "Feels like "),
                                   highTemperature: TextFormatter.formatTemperature(weatherData.mainValues.tempMax, units: units, prefix: "H "),
                                   lowTemperature: TextFormatter.formatTemperature(weatherData.mainValues.tempMin, units: units, prefix: "L "))
    }
}
