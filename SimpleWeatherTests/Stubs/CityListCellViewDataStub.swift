//
//  CityListCellViewDataStub.swift
//  SimpleWeatherTests
//
//  Created by Anton Shevtsov on 28/01/2021.
//

struct CityListCellViewDataStub {
    static let weatherData1 = CityListCellViewData(from: WeatherStub.weatherData1, units: .metric, isLoading: false)
    static let weatherData2 = CityListCellViewData(from: WeatherStub.weatherData2, units: .metric, isLoading: false)
    static let weatherData3 = CityListCellViewData(from: WeatherStub.weatherData3, units: .metric, isLoading: false)
    static let weatherData4 = CityListCellViewData(from: WeatherStub.weatherData4, units: .metric, isLoading: false)
    static let empty = CityListCellViewData(from: nil, units: .metric, isLoading: false)
}
