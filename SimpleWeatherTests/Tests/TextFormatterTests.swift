//
//  TextFormatterTests.swift
//  SimpleWeatherTests
//
//  Created by Anton Shevtsov on 28/01/2021.
//

import XCTest

class TextFormatterTests: XCTestCase {

    func testFormatTemperatureMetricPositiveWithPrefix() {
        // given expected string
        let expectedString = "HIGH +20°C"
        // when calling format temperature method
        let resultString = TextFormatter.formatTemperature(20, units: .metric, prefix: "HIGH ")
        // then expected and formatted strings are equal
        XCTAssertEqual(expectedString, resultString)
    }

    func testFormatTemperatureImperialNegativeNoPrefix() {
        // given expected string
        let expectedString = "-140°F"
        // when calling format temperature method
        let resultString = TextFormatter.formatTemperature(-140, units: .imperial)
        // then expected and formatted strings are equal
        XCTAssertEqual(expectedString, resultString)
    }
}
