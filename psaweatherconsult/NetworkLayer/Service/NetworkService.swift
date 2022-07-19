//
//  NetworkService.swift
//  psaweatherconsult
//
//  Created by mhd on 14/07/2022.
//

import Foundation

public typealias RequestSuccessResponse = (
    statusCode: Int,
    data: Data
)

/** Protocol used to handle network request  */
protocol NetworkService {
    /**
     Function used to perform network request
     - Parameter request: URLRequest used to configure network query
     - Parameter completion: callback used to handle the end of request
     */
    func request(_ request: URLRequest, completion: @escaping (Swift.Result<RequestSuccessResponse, Error>) -> Void)
    
    /** Used to cancel ongoing request */
    func cancel()
}

/** Base implementation of NetworkingProvider */
final class NetworkServiceImpl: NetworkService {
    
    private var dataTask: URLSessionDataTask?
    private let session: URLSession = {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 120
        sessionConfig.timeoutIntervalForResource = 120
        let session = URLSession(configuration: sessionConfig)
        return session
    }()
    
    func request(_ request: URLRequest, completion: @escaping (Swift.Result<RequestSuccessResponse, Error>) -> Void) {
        
        Logger.d(tag: "Header", message: request.allHTTPHeaderFields?.description ?? "")
        
        dataTask = session.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else {
                Logger.e(tag: "NetworkServiceImpl",
                         message: "request: dataTask?.resume() - Self nil after completion")
                completion(.failure(ApplicationError.unknow(error: nil)))
                return
            }
            defer { self.dataTask = nil }
            
            var statusCode: Int = 0
            
            if let httpResponse = response as? HTTPURLResponse {
                Logger.d(tag: "NetworkServiceImpl",
                         message: "request -  on url: \(request.url?.absoluteString ?? "") response status code: \(httpResponse.statusCode)")
                statusCode = httpResponse.statusCode
            }
            
            #if DEBUG
            if let data = data, let resultForDebug  = data.dictionary() {
                    Logger.d(tag: "NetworkServiceImpl",
                             message: "request - request succed with result: \(resultForDebug)")
                }
            #endif
            
            guard let data = data else {
                if let error = error {
                    Logger.e(tag: "NetworkServiceImpl",
                             message: """
                             fetch - error on url: \(request.url?.absoluteString ?? "") with the following description: \(error.localizedDescription)
                             """)
                    completion(.failure(ApplicationError.server))
                    return
                }
                
                Logger.e(tag: "NetworkServiceImpl", message: "unHandledCallBack")
                assertionFailure("unHandledCallBack")
                return
            }
            completion(.success((statusCode, data)))
        }
        
        dataTask?.resume()
    }
    
    func cancel() {
        self.dataTask?.cancel()
    }
    
}
