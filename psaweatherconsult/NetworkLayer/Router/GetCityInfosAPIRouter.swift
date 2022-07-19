//
//  GetCityInfosAPIRouter.swift
//  psaweatherconsult
//
//  Created by mhd on 14/07/2022.
//

import Foundation


enum GetCityInfosAPIRouter: NetworkRouter {
    
    case getCity(cityName: String)
    
    var method: NetworkHTTPMethod {
        return .get
    }
    
    var path: String? {
        switch self {
        case .getCity(let cityName):
            return "geo/1.0/direct?q=\(cityName)&limit=1&appid=\(Constants.apiKey)"
        }
    }
    
}
