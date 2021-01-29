//
//  WeatherIcon.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

import UIKit

enum WeatherIcon: String, Decodable, Equatable {
    case clearDay = "01d"
    case clearNight = "01n"
    case fewCloudsDay = "02d"
    case fewCloudsNight = "02n"
    case cloudsDay = "03d"
    case cloudsNight = "03n"
    case moreCloudsDay = "04d"
    case moreCloudsNight = "04n"
    case heavyRainDay = "09d"
    case heavyRainNight = "09n"
    case rainDay = "10d"
    case rainNight = "10n"
    case stormDay = "11d"
    case stormNight = "11n"
    case snowDay = "13d"
    case snowNight = "13n"
    case mistDay = "50d"
    case mistNight = "50n"
    case none

    var uiImage: UIImage? {
        return UIImage(named: rawValue)
    }
}
