//
//  Weather.swift
//  psaweatherconsult
//
//  Created by mhd on 18/07/2022.
//

import Foundation

struct Weather: Decodable {
    
    let id: Int
    let main: String
    let description: String?
    let icon: String
    
}
