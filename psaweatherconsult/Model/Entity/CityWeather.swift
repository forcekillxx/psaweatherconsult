//
//  Weather.swift
//  psaweatherconsult
//
//  Created by mhd on 14/07/2022.
//

import Foundation

struct CityWeather : Decodable {
    
    let timezone: String?
    let current: Current
    
    func date() -> Date? {
        if (current.dt == nil) {
            return nil
        }
        let ti = TimeInterval(current.dt!)
        return Date(timeIntervalSince1970: ti)
    }
    
    func dateString(format: String) -> String {
        if let date = date() {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = format
            return dateFormatter.string(from: date)
        }
        return ""
    }
    
}
