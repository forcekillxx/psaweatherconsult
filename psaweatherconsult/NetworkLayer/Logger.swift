//
//  Logger.swift
//  psaweatherconsult
//
//  Created by mhd on 14/07/2022.
//

import Foundation

final class Logger: NSObject {
    
    private struct Const {
        static var date: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
            return dateFormatter.string(from: Date())
        }
    }
    
    static func i(tag: String, message: String) {
        print("INFORMATION ๐๐๐ - \(Const.date) - \(tag): " + message)
    }
    
    static func d(tag: String, message: String) {
        #if DEBUG
            print("DEBUG ๐ ๐ ๐  - \(Const.date) - \(tag): " + message)
        #endif
    }
    
    static func w(tag: String, message: String) {
        print("WARNING โ ๏ธโ ๏ธโ ๏ธย - \(Const.date) - \(tag): " + message)
    }
    
    static func e(tag: String, message: String, trace: Any? = nil) {
        print("ERROR ๐งจ๐งจ๐งจย - \(Const.date) - \(tag): " + message, "Trace:", trace ?? "", separator: "\n")
    }
    
    static func crash(tag: String, message: String, trace: Any? = nil) {
        print("CRASH ๐ฅ๐ฅ๐ฅ - \(Const.date)ย - \(tag): " + message, "Trace:", trace ?? "", separator: "\n")
    }
}
