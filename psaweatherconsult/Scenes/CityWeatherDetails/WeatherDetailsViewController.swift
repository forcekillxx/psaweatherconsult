//
//  WeatherDetailsViewController.swift
//  psaweatherconsult
//
//  Created by mhd on 15/07/2022.
//

import Foundation
import UIKit

class WeatherDetailsViewController: UIViewController {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var todayView: UIView!
    @IBOutlet weak var nextDaysView: UIView!
    
    @IBOutlet weak var weatherIconImage: UIImageView!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var weatherMainLabel: UILabel!
    @IBOutlet weak var timezoneLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    
    var city: City!
    var presenter : WeatherDetailsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = WeatherDetailsPresenter(view : self)
        setupView()
        presenter.getWeatherDetails(city: city)
    }
    
    func setupView() {
        todayView.layer.cornerRadius = 8.0
        todayView.layer.shadowColor = UIColor.lightGray.cgColor
        todayView.layer.shadowOpacity = 2
        todayView.layer.shadowOffset = CGSize.zero
        todayView.layer.shadowRadius = 4
    }
    
}

extension WeatherDetailsViewController : WeatherDetailsProtocol {
    
    func reloadData(cityWeather: CityWeather) {
        
        weatherIconImage.image = UIImage(named: cityWeather.current.weather?.first?.icon ?? "AppIcon")
        dateLabel.text = Utils.dateString(dt : String(cityWeather.current.dt!),format: "YYYY/MM/dd")
        weatherDescriptionLabel.text = cityWeather.current.weather?.first?.description
        
        pressureLabel.text = cityWeather.current.pressure?.description ?? ""
        humidityLabel.text = cityWeather.current.humidity?.description ?? ""
        tempLabel.text = (String(format: "%.1f", cityWeather.current.temp - 273.15)) + "°C"
        windSpeedLabel.text = cityWeather.current.windSpeed?.description ?? ""
        weatherMainLabel.text = cityWeather.current.weather?.first?.description ?? ""
        timezoneLabel.text = cityWeather.timezone ?? ""
        sunriseLabel.text = Utils.dateString(dt : String(cityWeather.current.sunrise!),format: "HH:mm")
        sunsetLabel.text = Utils.dateString(dt : String(cityWeather.current.sunset!),format: "HH:mm")
    }
    
    func displayError(error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
}
