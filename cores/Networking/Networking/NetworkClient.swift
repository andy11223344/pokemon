//
//  NetworkClient.swift
//  Networking
//
//  Created by Andy ⠀ on 05/01/24.
//

import Foundation

public protocol INetworkClient {
    var urlSession: URLSession { get }
    
    func request<T: Codable>(config: NetworkConfiguration, completion: ((_ result: Result<T, ErrorResult>) -> Void)?)
}

public class NetworkClient: INetworkClient  {
    public var urlSession: URLSession {
        let config: URLSessionConfiguration = .default
//        config.protocolClasses = [CustomURLProtocol.self]
        return URLSession(configuration: config)
    }
    
    public init() {}
    
    public func request<T: Codable>(config: NetworkConfiguration, completion: ((_ result: Result<T, ErrorResult>) -> Void)? = nil) {
        guard let request = try? config.asURLRequest() else {
            completion?(.failure(.unknown))
            return
        }
        
        let url = request.url?.absoluteString ?? ""
        print("request: \(url)")
        
        urlSession.dataTask(with: request){ (data, response, error) in
            guard let data = data, error == nil else {
                completion?(.failure(ErrorResult.dataNil))
                return
            }

            do {
                let results = try JSONDecoder().decode(T.self, from: data)
                print("request: \(url) | success")
                completion?(.success(results))
            } catch let decodingError {
                print(decodingError.localizedDescription)
                print("request: \(url) | error")
                completion?(.failure(ErrorResult.errMessage(message: decodingError.localizedDescription)))
            }

        }.resume()
    }
}
