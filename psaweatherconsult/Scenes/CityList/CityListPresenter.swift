//
//  CityListPresenter.swift
//  psaweatherconsult
//
//  Created by mhd on 15/07/2022.
//

import Foundation

class CityListPresenter {
    
    weak var view : CityListProtocol!
    
    init(view : CityListProtocol) {
        self.view = view
    }
    
    func numberOfItems()-> Int {
        return MyVariables.citys.count
    }
    
    func configure(cell: CityCell, indexPath: IndexPath) {
        let city = MyVariables.citys[indexPath.row]
        cell.configure(cityWeather: city)
    }
    
    func didSelectedItemAt(indexPath : IndexPath){
        view.showWeatherDetail(city: MyVariables.citys[indexPath.row])
    }
    
    func testDataNumber() {
        if MyVariables.citys.count == 0 {
            view.displayErrorNoData()
        }
    }
    
    func getWeatherList() {
        //        weatherListWorker.getWeatherList(completionHandler: { [weak self] result in
        //            guard let self = self else { return }
        //            switch result {
        //            case .success(let weatherList):
        //                self.view.hideLoader()
        //                self.citiesList = weatherList.list!
        //                self.view.reloadData()
        //            case .failure(let error):
        //                self.view.hideLoader()
        //                self.view.displayError(error: error)
        //            }
        //        })
    }
    
}
