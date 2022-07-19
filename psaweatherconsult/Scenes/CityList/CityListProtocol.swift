//
//  CityListProtocol.swift
//  psaweatherconsult
//
//  Created by mhd on 15/07/2022.
//

import Foundation

protocol CityListProtocol : AnyObject {
    
    /**
     Used to reload data when getting them from the api
     */
    func reloadData()
    /**
     Used to open weather detail screen
     - Parameter city: Object that contains the selected city
     */
    func showWeatherDetail(city: City)
    /**
     Used to display the error
     - Parameter error: Object that contains the error
     */
    func displayError(error : Error)
    /**
     Used to display the error if no cities saved
     */
    func displayErrorNoData()
    
}
