//
//  WeatherManagerMock.swift
//  SimpleWeatherTests
//
//  Created by Anton Shevtsov on 28/01/2021.
//

class WeatherManagerMock: WeatherManagerInterface {

    var units: Units = .metric
    var stub: WeatherResponse?
    var errorStub: WeatherManagerError?

    var didRequestCalled: CompletionValueClosure<City>?

    func getWeatherData(forCity city: City,
                        completion: @escaping CompletionValueClosure<Result<WeatherResponse, WeatherManagerError>>) {
        didRequestCalled?(city)
        if let stub = stub {
            completion(.success(stub))
        } else {
            completion(.failure(errorStub ?? .objectNotFound))
        }
    }
}
