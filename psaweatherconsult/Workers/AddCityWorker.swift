//
//  AddCityWorker.swift
//  psaweatherconsult
//
//  Created by mhd on 14/07/2022.
//

import Foundation

class AddCityWorker {
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManagerImpl()) {
        self.networkManager = networkManager
    }
    
    /**
     Used to configure and perform network request
     - Parameter cityName: Object that contains city name for the call
     - Parameter completionHandler: completion: callback used to handle the end of request
     */
    
    func getCityInfos(cityName: String, completionHandler: @escaping (Result<[City], Error>) -> ()) {
        networkManager.fetch(GetCityInfosAPIRouter.getCity(cityName: cityName)) { (result: Result<[City], Error>) in
            switch result {
            case .success(let cities):
                completionHandler(.success(cities))
            case .failure(let failure):
                completionHandler(.failure(failure))
            }
        }
    }
    
}
