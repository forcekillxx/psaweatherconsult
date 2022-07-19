//
//  Description.swift
//  psaweatherconsult
//
//  Created by mhd on 18/07/2022.
//

import Foundation

enum Description: String, Decodable {
    
    case cielDégagé = "ciel dégagé"
    case légèrePluie = "légère pluie"
    case nuageux = "nuageux"
    case partiellementNuageux = "partiellement nuageux"
    case peuNuageux = "peu nuageux"
    
}
