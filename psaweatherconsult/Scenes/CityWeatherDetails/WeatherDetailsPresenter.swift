//
//  WeatherDetailsPresenter.swift
//  psaweatherconsult
//
//  Created by mhd on 15/07/2022.
//

import Foundation

class WeatherDetailsPresenter {
    
    weak var view : WeatherDetailsProtocol!
    var weatherDetailsWorker = WeatherDetailsWorker()
    
    init(view : WeatherDetailsProtocol) {
        self.view = view
    }
    
    func getWeatherDetails(city :City) {
        weatherDetailsWorker.getWeatherInfos(lat: city.lat, lon: city.lon) { result in
            switch result {
            case .success(let weather):
                self.view.reloadData(cityWeather: weather)
                print(weather)
            case .failure(let error):
                print("error: ", error)
            }
        }
    }
    
}
