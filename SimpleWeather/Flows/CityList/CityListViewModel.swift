//
//  CityListViewModel.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

import Combine

class CityListViewModel {

    // MARK: - Internal computed properties
    var numberOfItems: Int {
        return items.count
    }

    // MARK: - Internal stored properties
    let navigation = PassthroughSubject<MainCoordinatorRoute, Never>()

    // MARK: - Private stored properties
    private var items = [CityListCellViewModeling]()
    private let cityList: [City]
    private let weatherManager: WeatherManagerInterface
    private let cellViewModelFactory: CityListCellViewModelFactoryProviding
    private var weatherCache = [City: WeatherResponse]()

    // MARK: - Internal methods
    init(settings: CityListSettingsProvider,
         weatherManager: WeatherManagerInterface = WeatherManager(),
         cellViewModelFactory: CityListCellViewModelFactoryProviding = CityListCellViewModelFactory()) {
        self.cityList = settings.cities
        self.cellViewModelFactory = cellViewModelFactory
        self.weatherManager = weatherManager
        self.weatherManager.units = settings.units
    }

    func cellTapped(at row: Int) {
        guard let city = cityList[safe: row],
              let weather = weatherCache[city] else { return }
        navigation.send(.showDetails(weather))
    }

    func getCellViewModel(for row: Int) -> CityListCellViewModeling? {
        return items[safe: row]
    }

    func populateList() {
        items = cityList.map { city in
            cellViewModelFactory.createViewModel(cityName: city, units: weatherManager.units) { [weak self] completion in
                self?.getWeatherForCity(city, completion: completion)
            }
        }
    }

    // MARK: - Private methods
    private func getWeatherForCity(_ city: City,
                                   completion: @escaping CompletionValueClosure<Result<WeatherData, WeatherManagerError>>) {
        if let weatherData = weatherCache[city]?.list.first {
            completion(.success(weatherData))
        } else {
            weatherManager.getWeatherData(forCity: city) { [weak self] result in
                switch result {
                case .success(let weather):
                    self?.weatherCache[city] = weather
                    if let weatherData = weather.list.first {
                        completion(.success(weatherData))
                    } else {
                        completion(.failure(.objectNotFound))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
