//
//  Utils.swift
//  psaweatherconsult
//
//  Created by mhd on 19/07/2022.
//

import Foundation
import UIKit

class Utils {
    
    public static func dateString(dt: String, format: String) -> String {
        let ti = TimeInterval(dt)
        let date = Date(timeIntervalSince1970: ti!)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
        
    }
    
}
