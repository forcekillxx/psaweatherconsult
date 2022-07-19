//
//  Current.swift
//  psaweatherconsult
//
//  Created by mhd on 18/07/2022.
//

import Foundation

struct Current: Decodable {
    
    let dt: Int?
    let sunrise, sunset: Int?
    let temp: Double
    //let feelsLike: Double
    let pressure, humidity: Int?
    let dewPoint, uvi: Double?
    let clouds, visibility: Int?
    let windSpeed: Double?
    let windDeg: Int?
    let windGust: Double?
    let weather: [Weather]?
    let pop: Int?
    
}
