//
//  CityListCellViewModelFactory.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 29/01/2021.
//

protocol CityListCellViewModelFactoryProviding {
    func createViewModel(cityName: String, units: Units, weatherPromise: @escaping WeatherPromise) -> CityListCellViewModeling
}

class CityListCellViewModelFactory: CityListCellViewModelFactoryProviding {
    func createViewModel(cityName: String, units: Units, weatherPromise: @escaping WeatherPromise) -> CityListCellViewModeling {
        return CityListCellViewModel(cityName: cityName, units: units, weatherPromise: weatherPromise)
    }
}
