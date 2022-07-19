//
//  NetworkManager.swift
//  psaweatherconsult
//
//  Created by mhd on 14/07/2022.
//

import Foundation

/** Protocol used to handler network request  */
protocol NetworkManager {
    
    /**
     Used to configure and perform network request
     - Parameter router: Object that contains data used to configure resquest
     - Parameter completion: completion: callback used to handle the end of request
     */
    func fetch<T: Decodable>(_ router: NetworkRouter, completion: ((Result<T, Error>) -> Void)?)
    
    /** Used to cancel ongoing network request */
    func cancel()
}

/** Base Implementation of NetworkManager */
final class NetworkManagerImpl: NetworkManager {
    
    // MARK: Private Properties
    
    private var networkService: NetworkService
    private var responseHandler: NetworkManagerResponseHandler?
    private var requestBuilder: RequestBuilder
    
    // MARK: Dependencies injection
    
    init(networkService: NetworkService = NetworkServiceFactory().service(),
         responseHandler: NetworkManagerResponseHandler? = NetworkManagerResponseHandlerImpl(),
         requestBuilder: RequestBuilder = RequestBuilderImpl()) {
        self.networkService = networkService
        self.responseHandler = responseHandler
        self.requestBuilder = requestBuilder
    }
    
    // MARK: Public Apis
    
    func fetch<T: Decodable>(_ router: NetworkRouter, completion: ((Result<T, Error>) -> Void)?) {
        do {
            let request = try requestBuilder.buildRequest(from: router)
            self.networkService.request(request) { [weak self] result in
                DispatchQueue.main.async {
                    guard let self = self else {
                        completion?(.failure(ApplicationError.unknow(error: nil)))
                        return
                    }
                  self.responseHandler?.handleResponse(result: result, completion: {[weak self] (result: Result<T, ApplicationError>) in
                    switch result {
                    case .success(let value):
                      completion?(.success(value))
                    case .failure(let error):
                      completion?(.failure(error))
                    }
                  })
                }
            }
        } catch {
            completion?(.failure(error))
        }
    }
    
    func cancel() {
        self.networkService.cancel()
    }
}
