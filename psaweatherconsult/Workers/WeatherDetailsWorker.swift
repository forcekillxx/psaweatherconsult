//
//  WeatherDetailsWorker.swift
//  psaweatherconsult
//
//  Created by mhd on 15/07/2022.
//

import Foundation

class WeatherDetailsWorker {
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManagerImpl()) {
        self.networkManager = networkManager
    }
    
    /**
     Used to configure and perform network request
     - Parameter lat: Double that contains latidude of the city for the call
     - Parameter lon: Double that contains longitude of the city for the call
     - Parameter completionHandler: completion: callback used to handle the end of request
     */
    
    func getWeatherInfos(lat: Double, lon: Double, completionHandler: @escaping (Result<CityWeather, Error>) -> ()) {
        networkManager.fetch(GetWeatherInfosAPIRouter.getWeather(lat: lat, lon: lon)) { (result: Result<CityWeather, Error>) in
            switch result {
            case .success(let weather):
                completionHandler(.success(weather))
            case .failure(let failure):
                completionHandler(.failure(failure))
            }
        }
    }
    
}
