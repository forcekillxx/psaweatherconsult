//
//  AddCityViewController.swift
//  psaweatherconsult
//
//  Created by mhd on 15/07/2022.
//

import Foundation
import UIKit
import MapKit

class AddCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var viewAddCity: UIView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var addCityWorker = AddCityWorker()
    var selectedCity: City?
    
    @IBAction func addCityAction(_ sender: Any) {
        addCity()
    }
    
    @IBAction func searchCityAction(_ sender: Any) {
        view.endEditing(true)
        searchCity()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityNameTextField.addTarget(self, action: #selector(AddCityViewController.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        self.viewAddCity.isHidden = true
    }
    
    func updateSelectedView() {
        self.viewAddCity.isHidden = false
        self.cityLabel.text = self.selectedCity?.name
        self.countryLabel.text = self.selectedCity?.state
        let initialLocation = CLLocation(latitude: self.selectedCity!.lat, longitude: self.selectedCity!.lon)
        mapView.centerToLocation(initialLocation)
    }
}

extension AddCityViewController: AddCityProtocol {
    
    
    
    func searchCity() {
        guard let cityName: String = self.cityNameTextField.text else { return }
        addCityWorker.getCityInfos(cityName: cityName) { result in
            switch result {
            case .success(let cityList):
                if cityList.count > 0 {
                    self.selectedCity = cityList[0]
                    self.updateSelectedView()
                } else {
                    self.displayError()
                }
                
            case .failure(let error):
                self.displayError(error: error)
            }
        }
    }
    
    func displayError(error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func displayError() {
        let alert = UIAlertController(title: "Error", message: "Pas de données", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func addCity() {
        guard let city: City = self.selectedCity else { return }
        DataSource.citys.append(city)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

private extension MKMapView {
    func centerToLocation(
        _ location: CLLocation,
        regionRadius: CLLocationDistance = 15000
    ) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
    
}
