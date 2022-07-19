//
//  Data+Extensions.swift
//  psaweatherconsult
//
//  Created by mhd on 14/07/2022.
//

import Foundation

extension Data {
    /// Parse Data to [String: Any]
    func dictionary() -> [String: Any]? {
        let json = try? JSONSerialization.jsonObject(with: self, options: .allowFragments)
        if json == nil {
            return nil
        } else {
            return (try? JSONSerialization.jsonObject(with: self, options: .allowFragments)).flatMap { $0 as? [String: Any] }
        }
    }
    
    /// Parse Data to NSString (used for debug purposes)
    var prettyPrintedJSONString: NSString? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

        return prettyPrintedString
    }
    
}
