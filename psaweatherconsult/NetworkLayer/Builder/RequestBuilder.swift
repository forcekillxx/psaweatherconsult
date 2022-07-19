//
//  RequestBuilder.swift
//  psaweatherconsult
//
//  Created by mhd on 14/07/2022.
//

import Foundation

/** Protocol used to build request from root */
protocol RequestBuilder {
    func buildRequest(from router: NetworkRouter) throws -> URLRequest
}

/** Base implementation of RequestBuilder */
final class RequestBuilderImpl: RequestBuilder {
    // MARK: Private APIs
    
    
    // MARK: Public APIs
    func buildRequest(from router: NetworkRouter) throws -> URLRequest {
        guard let url = url(with: (router.path ?? "").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)) else {
            throw ApplicationError.invalidForm
        }
        // TODO: We must remove this test case when update path
        // TODO: when we will use a2s download image services) in HighMapAPIRouter
        
        var request = URLRequest(url: url)
        request.httpMethod = router.method.rawValue
        if let headers = router.headers {
            request.allHTTPHeaderFields =  headers
        }
        
        if let httpBody = router.httpBody {
            request.httpBody = httpBody
        } else if let parameters = router.parameters {
            switch router.contentType {
            case .json:
                request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
            }
        }
        
        return request
    }
    
    // MARK: Private APIs
    
    /** Configure a request url with a path */
    private func url(with path: String?) -> URL? {
        guard let path = path, let url = URL(string: Constants.BaseURL + path) else {
            return nil
        }
        return url
    }
}
