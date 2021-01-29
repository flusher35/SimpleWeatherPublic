//
//  WeatherStub.swift
//  SimpleWeatherTests
//
//  Created by Anton Shevtsov on 28/01/2021.
//

struct WeatherStub {
    /// for details view data 1
    static let response1 = WeatherResponse(list: [weatherData1, weatherData2], city: CityInfo(name: "testCity1", timeZone: 2000))
    
    /// for details view data 2
    static let response2 = WeatherResponse(list: [weatherData3, weatherData4], city: CityInfo(name: "testCity2", timeZone: 1000))

    static let weatherInfo1 = WeatherInfo(main: "Rain", description: "Raining now", icon: .rainDay)
    static let weatherInfo2 = WeatherInfo(main: "Sunny", description: "Sunny night", icon: .clearNight)
    static let weatherData1 = WeatherData(mainValues: WeatherValues(temp: 22, pressure: 1000, humidity: 90, tempMin: 4, tempMax: 25, feelsLike: 22),
                                 weatherInfo: [weatherInfo1])
    static let weatherData2 = WeatherData(mainValues: WeatherValues(temp: 10, pressure: 900, humidity: 50, tempMin: 11, tempMax: 35, feelsLike: 29),
                                 weatherInfo: [weatherInfo1])
    static let weatherData3 = WeatherData(mainValues: WeatherValues(temp: 2, pressure: 1200, humidity: 0, tempMin: -10, tempMax: 5, feelsLike: -1),
                                 weatherInfo: [weatherInfo2])
    static let weatherData4 = WeatherData(mainValues: WeatherValues(temp: 40, pressure: 100, humidity: 10, tempMin: 30, tempMax: 50, feelsLike: 44),
                                 weatherInfo: [weatherInfo2])
}
