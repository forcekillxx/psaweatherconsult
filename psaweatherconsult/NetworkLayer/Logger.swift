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
        print("INFORMATION 👀👀👀 - \(Const.date) - \(tag): " + message)
    }
    
    static func d(tag: String, message: String) {
        #if DEBUG
            print("DEBUG 🛠🛠🛠 - \(Const.date) - \(tag): " + message)
        #endif
    }
    
    static func w(tag: String, message: String) {
        print("WARNING ⚠️⚠️⚠️ - \(Const.date) - \(tag): " + message)
    }
    
    static func e(tag: String, message: String, trace: Any? = nil) {
        print("ERROR 🧨🧨🧨 - \(Const.date) - \(tag): " + message, "Trace:", trace ?? "", separator: "\n")
    }
    
    static func crash(tag: String, message: String, trace: Any? = nil) {
        print("CRASH 💥💥💥 - \(Const.date) - \(tag): " + message, "Trace:", trace ?? "", separator: "\n")
    }
}
