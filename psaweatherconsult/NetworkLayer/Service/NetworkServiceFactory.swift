//
//  NetworkServiceFactory.swift
//  psaweatherconsult
//
//  Created by mhd on 14/07/2022.
//

import Foundation

/** Factory used to provide network service in terms of  Application config  */
final class NetworkServiceFactory {

    // MARK: Life cycle
    
    
    // MARK: Public APIs
    func service() -> NetworkService {
        return NetworkServiceImpl()
    }
    
}
