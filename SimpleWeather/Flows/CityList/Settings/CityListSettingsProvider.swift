//
//  CityListSettingsProvider.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

protocol CityListSettingsProvider {
    var cities: [City] { get }
    var units: Units { get }
}
