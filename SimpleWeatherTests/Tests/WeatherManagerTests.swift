//
//  WeatherManagerTests.swift
//  SimpleWeatherTests
//
//  Created by Anton Shevtsov on 28/01/2021.
//

import XCTest

class WeatherManagerTests: XCTestCase {

    let networkManagerMock = NetworkManagerMock<WeatherResponse>()
    lazy var weatherManager = WeatherManager(apiSettings: APISettings(), networkManager: networkManagerMock)

    func testGetWeather() {
        // given expected weather to receive
        let expectedWeather = WeatherStub.response1
        networkManagerMock.stub = expectedWeather
        let weatherExpectation = expectation(description: #function)
        var receivedWeather: WeatherResponse?
        // when making request for weather
        weatherManager.getWeatherData(forCity: expectedWeather.city.name) { response in
            switch response {
            case .success(let weather):
                receivedWeather = weather
                weatherExpectation.fulfill()
            case .failure(_): XCTFail()
            }
        }
        waitForExpectations(timeout: 0.1, handler: nil)
        // then expected weather is received
        XCTAssertEqual(receivedWeather, expectedWeather)
    }

    func testGetError() {
        // given expected network error to receive
        networkManagerMock.errorStub = .invalidStatus
        let weatherExpectation = expectation(description: #function)
        let expectedError = WeatherManagerError.networkError(.invalidStatus)
        var receivedError: WeatherManagerError?
        // when making request for weather
        weatherManager.getWeatherData(forCity: "") { response in
            switch response {
            case .success(_): XCTFail()
            case .failure(let error):
                receivedError = error
                weatherExpectation.fulfill()
            }
        }
        waitForExpectations(timeout: 0.1, handler: nil)
        // then expected weather manager error is received
        XCTAssertEqual(receivedError, expectedError)
    }
}
