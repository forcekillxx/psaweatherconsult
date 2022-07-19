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
        return DataSource.citys.count
    }
    
    func configure(cell: CityCell, indexPath: IndexPath) {
        let city = DataSource.citys[indexPath.row]
        cell.configure(cityWeather: city)
    }
    
    func didSelectedItemAt(indexPath : IndexPath){
        view.showWeatherDetail(city: DataSource.citys[indexPath.row])
    }
    
    func testDataNumber() {
        if DataSource.citys.count == 0 {
            view.displayErrorNoData()
        }
    }
    
}
