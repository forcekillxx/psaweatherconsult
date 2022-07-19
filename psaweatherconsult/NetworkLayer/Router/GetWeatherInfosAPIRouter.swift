//
//  getWeatherInfosAPIRouter.swift
//  psaweatherconsult
//
//  Created by mhd on 17/07/2022.
//

import Foundation

enum GetWeatherInfosAPIRouter: NetworkRouter {
    
    case getWeather(lat: Double, lon: Double)
    
    var method: NetworkHTTPMethod {
        return .get
    }
    
    var path: String? {
        switch self {
        case .getWeather(let lat, let lon):
            return "data/2.5/onecall?lat=\(lat)&lon=\(lon)&lang=fr&appid=\(Constants.apiKey)"
        }
    }
    
}
