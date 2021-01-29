//
//  Settings.swift
//  SimpleWeatherTests
//
//  Created by Anton Shevtsov on 29/01/2021.
//

struct TestStubbedSettings: CityListSettingsProvider {
    let cities = ["testCity1"]
    let units = Units.metric
}

struct TestNonStubbedSettings: CityListSettingsProvider {
    let cities = ["New York", "Chicago", "Portland", "San Francisco", "Baker Lake", "Madrid", "Riga"]
    let units = Units.metric
}
