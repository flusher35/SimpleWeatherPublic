//
//  Aliases.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 27/01/2021.
//

typealias WeatherPromise = CompletionValueClosure<CompletionValueClosure<Result<WeatherData, WeatherManagerError>>>

typealias CompletionClosure = () -> Void
typealias CompletionValueClosure<T> = (_ value: T) -> Void
typealias CompletionValuesArrayClosure<T> = (_ values: [T]) -> Void
typealias CompletionTwoValuesClosure<T, E> = (_ value1: T, _ value2: E) -> Void
