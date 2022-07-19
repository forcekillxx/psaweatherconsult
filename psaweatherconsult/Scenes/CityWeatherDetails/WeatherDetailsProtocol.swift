//
//  WeatherDetailsProtocol.swift
//  psaweatherconsult
//
//  Created by mhd on 15/07/2022.
//

import Foundation

protocol WeatherDetailsProtocol : AnyObject {
    
    /**
     Used to reload data when getting them from the api
     - Parameter cityWeather: Object that contains data that we have get from the api
     */
    func reloadData(cityWeather: CityWeather)
    /**
     Used to display the error
     - Parameter error: Object that contains the error
     */
    func displayError(error : Error)
    
}
