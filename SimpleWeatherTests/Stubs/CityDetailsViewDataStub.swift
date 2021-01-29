//
//  DetailsViewDataStub.swift
//  SimpleWeatherTests
//
//  Created by Anton Shevtsov on 28/01/2021.
//

struct CityDetailsViewDataStub {
    /// for weather response1
    static let stub1 = CityDetailsViewData(icon: .rainDay,
                                           temperature: "+22°C",
                                           cityName: "testCity1",
                                           condition: "Rain",
                                           feelsLike: "Feels like +22°C",
                                           highTemperature: "H +25°C",
                                           lowTemperature: "L +4°C")

    /// for weather response2
    static let stub2 = CityDetailsViewData(icon: .clearNight,
                                           temperature: "+2°C",
                                           cityName: "testCity2",
                                           condition: "Sunny",
                                           feelsLike: "Feels like -1°C",
                                           highTemperature: "H +5°C",
                                           lowTemperature: "L -10°C")
}
