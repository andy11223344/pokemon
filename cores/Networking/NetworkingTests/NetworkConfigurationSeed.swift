//
//  NetworkConfigurationSeed.swift
//  NetworkingTests
//
//  Created by Andy ⠀ on 05/01/24.
//

import Foundation
@testable import Networking

struct NetworkConfigurationSeed: NetworkConfiguration {
    var baseUrl: String = "http://www.abc.com"
    var path: String? = "/test_path"
    var method: HTTPMethod = .get
    var parameter: [String: String]? = nil
    var httpHeaders: HTTPHeaders? = nil
    
    init() {}
    
    init(baseUrl: String, path: String?, method: HTTPMethod, parameter: [String: String]?, httpHeaders: HTTPHeaders?) {
        self.baseUrl = baseUrl
        self.path = path
        self.method = method
        self.parameter = parameter
        self.httpHeaders = httpHeaders
    }
}
