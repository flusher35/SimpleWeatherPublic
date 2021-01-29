//
//  WeatherManager.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

import Foundation

enum WeatherManagerError: Error, Equatable {
    case networkError(NetworkError)
    case objectNotFound
    case invalidURL
}

protocol WeatherManagerInterface: AnyObject {
    var units: Units { get set }
    func getWeatherData(forCity: City,
                        completion: @escaping CompletionValueClosure<Result<WeatherResponse, WeatherManagerError>>)
}

class WeatherManager: WeatherManagerInterface {
    // MARK: - Internal stored properties
    var units: Units = .metric

    // MARK: - Private stored properties
    private let apiSettings: APISettingsProvider
    private var networkManager: NetworkManagerInterface

    // MARK: - Internal methods
    init(apiSettings: APISettingsProvider = APISettings(),
         networkManager: NetworkManagerInterface = NetworkManager()) {
        self.apiSettings = apiSettings
        self.networkManager = networkManager
    }

    func getWeatherData(forCity: City,
                        completion: @escaping CompletionValueClosure<Result<WeatherResponse, WeatherManagerError>>) {
        guard let url = constructURLForCityName(forCity) else {
            completion(.failure(.invalidURL))
            return
        }
        networkManager.getDataFrom(url: url) { (result: Result<WeatherResponse, NetworkError>) in
            switch result {
            case .failure(let error): completion(.failure(.networkError(error)))
            case .success(let weather): completion(.success(weather))
            }
        }
    }

    // MARK: - Private methods
    private func constructURLForCityName(_ cityName: String) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = apiSettings.apiHost
        components.path = apiSettings.apiPath
        components.queryItems = [
            URLQueryItem(name: "q", value: cityName),
            URLQueryItem(name: "appid", value: apiSettings.apiKey),
            URLQueryItem(name: "units", value: units.rawValue),
        ]
        return components.url
    }
}
