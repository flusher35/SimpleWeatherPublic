//
//  APISettings.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

protocol APISettingsProvider {
    var apiKey: String { get }
    var apiHost: String { get }
    var apiPath: String { get }
}

struct APISettings: APISettingsProvider {
    let apiKey = "##############################"
    let apiHost = "api.openweathermap.org"
    let apiPath = "/data/2.5/forecast"
}
