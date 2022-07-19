//
//  NetworkManagerResponseHandler.swift
//  psaweatherconsult
//
//  Created by mhd on 14/07/2022.
//

import UIKit

protocol NetworkManagerResponseHandler {
    func handleResponse<T: Decodable>(result: Result<RequestSuccessResponse, Error>, completion: ((Result<T, ApplicationError>) -> Void)?)
}

final class NetworkManagerResponseHandlerImpl: NetworkManagerResponseHandler {
    
    private var parser: Parser
    
    init(parser: Parser = ParserImpl()) {
        self.parser = parser
    }
    
    // Check if need more management.
    func handleResponse<T>(result: Result<RequestSuccessResponse, Error>, completion: ((Result<T, ApplicationError>) -> Void)?) where T: Decodable {
        switch result {
        case .success(let response):
            let statusCode = response.statusCode
            let data = response.data
            switch statusCode {
            case 200...299:
                handleValidReponse(data: data, completion: completion)
            case 404:
                completion?(.failure(.errorCodeHttp404))
            default:
                completion?(.failure(.unknow(error: nil)))
            }
        case .failure(let error): // unknown http error
             completion?(.failure(.unknow(error: error)))
        }
    }
    
    // Handle valid http response [200..299] and parse data
    private func handleValidReponse<T: Decodable>(data: Data, completion: ((Result<T, ApplicationError>) -> Void)?) {
            // Parse json response to needed model
            self.parser.parse(data: data) { (decodedResult: Result<T, Error>) in
                switch decodedResult {
                case .success(let value):
                    completion?(.success(value))
                case .failure(let error):
                    completion?(.failure(.unknow(error: error)))
                }
            }
    }
}
