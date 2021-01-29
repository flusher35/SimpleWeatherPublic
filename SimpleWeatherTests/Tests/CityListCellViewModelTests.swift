//
//  CityListCellViewModelTests.swift
//  SimpleWeatherTests
//
//  Created by Anton Shevtsov on 28/01/2021.
//

import XCTest

class CityListCellViewModelTests: XCTestCase {

    var loadingPattern = [Bool]()
    var receivedViewData: CityListCellViewData?

    func testGetViewDataOnce() {
        // given empty city list cell with some city name
        let weatherData = WeatherStub.weatherData1
        let viewModel = CityListCellViewModel(cityName: "some city", units: .metric) { completion in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                completion(.success(weatherData))
            }
        }
        let expectedViewData = CityListCellViewDataStub.weatherData1
        let loadExpectation = expectation(description: #function)
        let expectedLoadingPattern = [false, true, false]
        // when the cell is getting view data
        loadingPattern.append(viewModel.isLoading)
        viewModel.getViewData { viewData in
            self.loadingPattern.append(viewModel.isLoading)
            self.receivedViewData = viewData
            loadExpectation.fulfill()
        }
        loadingPattern.append(viewModel.isLoading)
        // then viewdata is received and cell is handling loading state properly
        waitForExpectations(timeout: 0.2, handler: nil)
        XCTAssertEqual(receivedViewData, expectedViewData)
        XCTAssertEqual(expectedLoadingPattern, loadingPattern)
    }

    func testGetViewDataForPreloadedWeatherData() {
        // given empty city list cell with some city name and preloaded viewdata
        let weatherData = WeatherStub.weatherData2
        let viewModel = CityListCellViewModel(cityName: "some city", units: .metric) { completion in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                completion(.success(weatherData))
            }
        }
        // preload weather data
        let loadExpectation1 = expectation(description: #function)
        viewModel.getViewData{ _ in loadExpectation1.fulfill() }
        waitForExpectations(timeout: 0.2, handler: nil)
        let expectedViewData = CityListCellViewDataStub.weatherData2
        let loadExpectation2 = expectation(description: #function)
        let expectedLoadingPattern = [false, false, false]
        // when the cell is getting view data that was already preloaded in view model
        loadingPattern.append(viewModel.isLoading)
        viewModel.getViewData { viewData in
            self.loadingPattern.append(viewModel.isLoading)
            self.receivedViewData = viewData
            loadExpectation2.fulfill()
        }
        loadingPattern.append(viewModel.isLoading)
        // then viewdata is received immediately and cell is not showing any loading state
        waitForExpectations(timeout: 0.2, handler: nil)
        XCTAssertEqual(receivedViewData, expectedViewData)
        XCTAssertEqual(expectedLoadingPattern, loadingPattern)
    }

    func testGetViewDataOnError() {
        // given empty city list cell with some city name and faulty server
        let viewModel = CityListCellViewModel(cityName: "some city", units: .metric) { completion in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                completion(.failure(.networkError(.invalidStatus)))
            }
        }
        let expectedViewData = CityListCellViewDataStub.empty
        let loadExpectation = expectation(description: #function)
        let expectedLoadingPattern = [false, true, false]
        // when the cell is getting view data
        loadingPattern.append(viewModel.isLoading)
        viewModel.getViewData { viewData in
            self.loadingPattern.append(viewModel.isLoading)
            self.receivedViewData = viewData
            loadExpectation.fulfill()
        }
        loadingPattern.append(viewModel.isLoading)
        // then empty viewdata is received and cell is handling loading state properly
        waitForExpectations(timeout: 0.2, handler: nil)
        XCTAssertEqual(receivedViewData, expectedViewData)
        XCTAssertEqual(expectedLoadingPattern, loadingPattern)
    }
}
