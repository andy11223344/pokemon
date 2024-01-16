//
//  HttpHeadersDefault.swift
//  Networking
//
//  Created by Andy ⠀ on 05/01/24.
//

import Foundation

extension HTTPHeader {
    public static func contentType(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Content-Type", value: value)
    }
    
    public static func authorization(bearerToken: String) -> HTTPHeader {
        authorization("Bearer \(bearerToken)")
    }
    
    public static func authorization(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Authorization", value: value)
    }
    
    public static func userAgent(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "User-Agent", value: value)
    }
    
    public static func acceptLanguage(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Accept-Language", value: value)
    }
}

extension HTTPHeaders {
    public static let `default`: HTTPHeaders = [.defaultContentType, .defaultUserAgent]
}

extension HTTPHeader {
    public static let defaultUserAgent: HTTPHeader = {
        .acceptLanguage("ios")
    }()
    
    public static let defaultContentType: HTTPHeader = {
        .contentType("Application/json")
    }()
}
