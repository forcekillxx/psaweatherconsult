//
//  ViewController.swift
//  psaweatherconsult
//
//  Created by mhd on 14/07/2022.
//

import UIKit
import Foundation

class CityListTableViewController: UITableViewController {
    
    let worker = AddCityWorker()
    var presenter: CityListPresenter!
    
    @IBAction func onClick(_ sender: Any) {
        let addCityVC = UIStoryboard(name: "AddCity", bundle: nil).instantiateViewController(withIdentifier: "\(AddCityViewController.self)") as! AddCityViewController
        self.navigationController?.pushViewController(addCityVC, animated: true)
    }
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        presenter = CityListPresenter(view : self)
        presenter.testDataNumber()
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        reloadData()
    }
    
    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib.init(nibName: "CityCell", bundle: nil), forCellReuseIdentifier: "CityCell")
    }
    
    func showWeatherDetail(city: City) {
        let weatherDetailVC = UIStoryboard(name: "WeatherDetails", bundle: nil).instantiateViewController(withIdentifier: "\(WeatherDetailsViewController.self)") as! WeatherDetailsViewController
        weatherDetailVC.city = city
        self.navigationController?.pushViewController(weatherDetailVC, animated: true)
    }
    
}

extension CityListTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityCell
        presenter.configure(cell: cell, indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectedItemAt(indexPath : indexPath)
    }
    
}

extension CityListTableViewController: CityListProtocol {
    
    func reloadData() {
        self.tableView.reloadData()
    }
    
    func displayError(error: Error) {
        let alert = UIAlertController(title: "Erreur", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func displayErrorNoData() {
        let alert = UIAlertController(title: "Erreur", message: "Veuillez Ajouter une ville", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
}
