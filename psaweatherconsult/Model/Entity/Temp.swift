//
//  Temp.swift
//  psaweatherconsult
//
//  Created by mhd on 18/07/2022.
//

import Foundation

struct Temp: Decodable {
    let day, min, max, night: Double
    let eve, morn: Double
}
