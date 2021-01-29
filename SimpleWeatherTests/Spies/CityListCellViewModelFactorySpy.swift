//
//  CityListCellViewModelFactorySpy.swift
//  SimpleWeatherTests
//
//  Created by Anton Shevtsov on 29/01/2021.
//

class CityListCellViewModelFactorySpy: CityListCellViewModelFactoryProviding {

    var createdViewModel: CityListCellViewModelSpy?

    func createViewModel(cityName: String, units: Units, weatherPromise: @escaping WeatherPromise) -> CityListCellViewModeling {
        let viewModel = CityListCellViewModelSpy(cityName: cityName, promise: weatherPromise)
        createdViewModel = viewModel
        return viewModel
    }
}
