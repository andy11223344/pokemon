//
//  Configuration.swift
//  Networking
//
//  Created by Andy ⠀ on 05/01/24.
//

import Foundation

public protocol NetworkConfiguration: URLRequestConvertible {
    var baseUrl: String { get }
    
    ///make sure path start with `/`
    var path: String? { get }
    
    var method: HTTPMethod { get }
    
    var parameter: [String: String]? { get }
    
    var httpHeaders: HTTPHeaders? { get }
}

extension NetworkConfiguration {
//    var httpHeader: HTTPHeaders {
//        return .default
//    }
}

extension NetworkConfiguration {
    public func asURLRequest() throws -> URLRequest {
        
        guard let url = URLComponents.init(config: self)?.url else {
            throw(ErrorResult.invalidUrl)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.headers = httpHeaders ?? HTTPHeaders()
        
        return urlRequest
    }
}

extension URLComponents {
    init?(config: NetworkConfiguration) {
        var comps = URLComponents(string: config.baseUrl)
        if let path = config.path {
            comps?.path.append(contentsOf: path)
        }
        if let queryItems = config.parameter?.compactMap({
            URLQueryItem(name: $0.key,
                         value: $0.value)
        }) {
            comps?.queryItems = queryItems
        }
        
        self = comps ?? URLComponents()
    }
}

extension URLRequest {
    public var headers: HTTPHeaders {
        get { allHTTPHeaderFields.map(HTTPHeaders.init) ?? HTTPHeaders() }
        set { allHTTPHeaderFields = newValue.dictionary }
    }
}
