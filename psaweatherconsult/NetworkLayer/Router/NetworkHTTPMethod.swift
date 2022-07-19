//
//  NetworkHTTPMethod.swift
//  psaweatherconsult
//
//  Created by mhd on 14/07/2022.
//

import Foundation

enum NetworkHTTPMethod: String {
    
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
    
}
