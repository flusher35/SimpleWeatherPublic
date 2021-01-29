//
//  CityListViewModelTests.swift
//  SimpleWeatherTests
//
//  Created by Anton Shevtsov on 28/01/2021.
//

import Combine
import XCTest

class CityListViewModelTests: XCTestCase {

    var cancellableBag = Set<AnyCancellable>()
    let weatherManagerMock = WeatherManagerMock()
    let cellViewModelFactoryMock = CityListCellViewModelFactorySpy()

    func testPopulateList() {
        // given empty city list screen
        let settings = TestNonStubbedSettings()
        let viewModel = CityListViewModel(settings: settings, weatherManager: weatherManagerMock)
        // when list is populated
        viewModel.populateList()
        // then all cells are displayed
        XCTAssertEqual(viewModel.numberOfItems, settings.cities.count)
    }

    func testGetWeatherForCity() {
        // given city list screen and weather is not loaded yet
        let settings = TestNonStubbedSettings()
        let viewModel = CityListViewModel(settings: settings,
                                          weatherManager: weatherManagerMock)
        viewModel.populateList()
        let expectedCitySequence = settings.cities
        var receivedCitySequence = [City]()
        weatherManagerMock.didRequestCalled = {
            receivedCitySequence.append($0)
        }
        // when weather is being requested for each city
        settings.cities.indices.forEach { viewModel.getCellViewModel(for: $0)?.getViewData { _ in } }
        // then correct request sequence is made
        XCTAssertEqual(expectedCitySequence, receivedCitySequence)
    }

    func testGetWeatherData() {
        // given city list screen and weather is not loaded yet
        let settings = TestStubbedSettings()
        let viewModel = CityListViewModel(settings: settings,
                                          weatherManager: weatherManagerMock,
                                          cellViewModelFactory: cellViewModelFactoryMock)
        weatherManagerMock.stub = WeatherStub.response1
        let expectedWeatherData = WeatherStub.weatherData1
        var receivedWeatherData: WeatherData?
        let receiveExpectation = expectation(description: #function)
        viewModel.populateList()
        guard let cellViewModel = cellViewModelFactoryMock.createdViewModel else {
            return XCTFail()
        }
        // when cell is requesting weather
        cellViewModel.promise { result in
            switch result {
            case .success(let weatherData):
                receivedWeatherData = weatherData
                receiveExpectation.fulfill()
            case .failure(_): XCTFail()
            }
        }
        waitForExpectations(timeout: 0.1, handler: nil)
        // then correct weather data is received
        XCTAssertEqual(expectedWeatherData, receivedWeatherData)
    }

    func testNavigateToDetails() {
        // given city list screen with loaded weather
        let settings = TestStubbedSettings()
        let viewModel = CityListViewModel(settings: settings, weatherManager: weatherManagerMock)
        let expectedResponse = WeatherStub.response1
        weatherManagerMock.stub = expectedResponse
        viewModel.populateList()
        guard let cellViewModel = viewModel.getCellViewModel(for: 0) else {
            return XCTFail()
        }
        cellViewModel.getViewData { _ in }
        var receivedResponse: WeatherResponse?
        let navigationExpectation = expectation(description: #function)
        viewModel.navigation
            .sink { route in
                if case .showDetails(let data) = route {
                    receivedResponse = data
                    navigationExpectation.fulfill()
                } else {
                    XCTFail()
                }
            }
            .store(in: &cancellableBag)
        // when city cell is tapped
        viewModel.cellTapped(at: 0)
        waitForExpectations(timeout: 0.1, handler: nil)
        // then navigation with a correct data gets called
        XCTAssertEqual(expectedResponse, receivedResponse)
    }
}
