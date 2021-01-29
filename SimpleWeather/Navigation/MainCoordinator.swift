//
//  MainCoordinator.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

import Combine
import UIKit

class MainCoordinator: BaseCoordinator<MainCoordinatorRoute> {

    // MARK: - Internal methods
    override func start() {
        let viewModel = CityListViewModel(settings: DemoSettingsShort())
        viewModel.navigation
            .sink { [weak self] in self?.navigate($0) }
            .store(in: &cancellableBag)
        let viewController = CityListViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: false)
    }

    // MARK: - Private methods
    private func navigate(_ route: MainCoordinatorRoute) {
        switch route {
        case .showDetails(let weatherData): showDetails(weatherData)
        }
    }

    private func showDetails(_ weather: WeatherResponse) {
        let viewModel = CityDetailsViewModel(weather: weather)
        let viewController = CityDetailsViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
