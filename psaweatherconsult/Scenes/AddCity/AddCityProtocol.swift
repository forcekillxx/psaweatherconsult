//
//  AddCityProtocol.swift
//  psaweatherconsult
//
//  Created by mhd on 15/07/2022.
//

import Foundation

protocol AddCityProtocol: AnyObject {
    
    
    /**
     Used to search for a city in the api
     */
    func searchCity()
    /**
     Used to display the error
     - Parameter error: Object that contains the error
     */
    func displayError(error : Error)
    /**
     Used to display the error if no data
     */
    func displayError()
    
}
