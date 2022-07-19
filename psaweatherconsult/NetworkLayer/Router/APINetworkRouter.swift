//
//  APINetworkRouter.swift
//  psaweatherconsult
//
//  Created by mhd on 14/07/2022.
//

import Foundation

protocol APINetworkRouter {
    
    var method: NetworkHTTPMethod { get }
    var parameters: [String: Any]? { get }
    var path: String? { get }
    var headers: [String: String]? { get }
    var contentType: RequestContentType { get }
    
}

/** Base implementation of the router */
extension APINetworkRouter {
    
    var parameters: [String: Any]? {
        return nil
    }
    
    var headers: [String: String]? {
        return  [:]
    }
    
    var contentType: RequestContentType {
        return .json
    }
    
}
