//
//  Parser.swift
//  psaweatherconsult
//
//  Created by mhd on 14/07/2022.
//

import Foundation

/** Protocol used to parse the given data to the given generic type */
protocol Parser {
    func parse<T: Decodable>(data: Data) -> T?
    func parse<T: Decodable>(data: Data, completion: @escaping (Result<T, Error>) -> Void)
}

/** Base implementation of Parser */
final class ParserImpl: Parser {
    
    // MARK: Properties
    
    private let jsonDecoder: JSONDecoder
    
    // MARK: Life cycle
    
    init(jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.jsonDecoder = jsonDecoder
    }
    
    // MARK: Public Apis
    
    func parse<T: Decodable>(data: Data, completion: @escaping (Result<T, Error>) -> Void) {
        #if DEBUG
        if let prettyJson = data.prettyPrintedJSONString {
            Logger.d(tag: "PrettyJson", message: prettyJson as String)
        }
        #endif
        do {
            let result: T = try jsonDecoder.decode(T.self, from: data)
            completion(.success(result))
        } catch let error {
            #if DEBUG
            Logger.e(tag: "ParserImpl", message: "An error occured during parsing: " + error.localizedDescription, trace: error)
            completion(.failure(ApplicationError.decoding))
            #endif
        }
    }
    
    func parse<T: Decodable>(data: Data) -> T? {
        guard let result: T = try? jsonDecoder.decode(T.self, from: data) else {
            Logger.e(tag: "ParserImpl", message: "An error occured during parsing")
            return nil
        }
        return result
    }
}
