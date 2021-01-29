//
//  CityListCellViewModel.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

import UIKit

protocol CityListCellViewModeling {
    var cityName: String { get }
    var isLoading: Bool { get }
    func getViewData(_ completion: @escaping CompletionValueClosure<CityListCellViewData>)
}

class CityListCellViewModel: CityListCellViewModeling {
    
    // MARK: - Internal stored properties
    let cityName: String
    private(set)var isLoading = false

    // MARK: - Private stored properties
    private let units: Units
    private var weatherData: WeatherData?
    private let weatherPromise: WeatherPromise

    // MARK: - Internal methods
    init(cityName: String, units: Units, weatherPromise: @escaping WeatherPromise) {
        self.cityName = cityName
        self.units = units
        self.weatherPromise = weatherPromise
    }

    func getViewData(_ completion: @escaping CompletionValueClosure<CityListCellViewData>) {
        if let weatherData = weatherData {
            completion(CityListCellViewData(from: weatherData, units: units, isLoading: isLoading))
        } else if !isLoading {
            isLoading = true
            weatherPromise { [weak self] result in
                self?.isLoading = false
                switch result {
                case .success(let weatherData): self?.weatherData = weatherData
                case .failure(_): self?.weatherData = nil
                }
                guard let self = self else { return }
                completion(CityListCellViewData(from: self.weatherData, units: self.units, isLoading: self.isLoading))
            }
        }
    }
}
