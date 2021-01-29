//
//  CityDetailsViewModelTests.swift
//  SimpleWeatherTests
//
//  Created by Anton Shevtsov on 28/01/2021.
//

import XCTest

class CityDetailsViewModelTests: XCTestCase {

    let delegateSpy = CityDetailsViewModelDelegateSpy()

    func testGetViewData() {
        // given expected details view data to receive
        let expectedViewData = CityDetailsViewDataStub.stub2
        let viewModel = CityDetailsViewModel(weather: WeatherStub.response2)
        var receivedViewData: CityDetailsViewData?
        delegateSpy.didCallUpdate = { receivedViewData = $0 }
        // when opening a details screen
        viewModel.attach(delegate: delegateSpy)
        // then expected details view data is pushed to view
        XCTAssertEqual(receivedViewData, expectedViewData)
    }
}
