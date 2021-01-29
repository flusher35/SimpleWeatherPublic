//
//  CityDetailsViewModelDelegateSpy.swift
//  SimpleWeatherTests
//
//  Created by Anton Shevtsov on 28/01/2021.
//

class CityDetailsViewModelDelegateSpy: CityDetailsViewModelDelegate {

    var didCallUpdate: CompletionValueClosure<CityDetailsViewData>?

    func update(with viewData: CityDetailsViewData) {
        didCallUpdate?(viewData)
    }
}
