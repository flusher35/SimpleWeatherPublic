//
//  CityListCellViewModelSpy.swift
//  SimpleWeatherTests
//
//  Created by Anton Shevtsov on 29/01/2021.
//

class CityListCellViewModelSpy: CityListCellViewModeling {
    var cityName: String
    var isLoading: Bool
    var promise: WeatherPromise

    var didCallGetViewData: CompletionValueClosure<CompletionValueClosure<CityListCellViewData>>?

    init(cityName: String, isLoading: Bool = false, promise: @escaping WeatherPromise) {
        self.cityName = cityName
        self.isLoading = isLoading
        self.promise = promise
    }

    func getViewData(_ completion: @escaping CompletionValueClosure<CityListCellViewData>) {
        didCallGetViewData?(completion)
    }
}
