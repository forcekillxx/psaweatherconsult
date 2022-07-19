//
//  AddCityPresenter.swift
//  psaweatherconsult
//
//  Created by mhd on 15/07/2022.
//

import Foundation

class AddCityPresenter {
    
    weak var view : AddCityProtocol!
    var addCityWorker = AddCityWorker()
    private var weatherList = [[City]]()
    
    init(view : AddCityProtocol) {
        self.view = view
    }
    
}
