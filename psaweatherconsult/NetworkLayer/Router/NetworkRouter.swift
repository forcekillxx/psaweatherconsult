//
//  NetworkRouter.swift
//  psaweatherconsult
//
//  Created by mhd on 14/07/2022.
//

import Foundation

/** Protocol that define router properties used in network request to fetch data */
protocol NetworkRouter {
    var method: NetworkHTTPMethod { get }
    var parameters: [String: Any]? { get }
    var httpBody: Data? { get }
    var path: String? { get }
    var headers: [String: String]? { get }
    var contentType: RequestContentType { get }
}

/** Base implementation of the router */
extension NetworkRouter {
    var parameters: [String: Any]? {
        return nil
    }
    
    var httpBody: Data? {
        return nil
    }
    
    var headers: [String: String]? {
        return [:]
    }
    
    var contentType: RequestContentType {
        return .json
    }
}
