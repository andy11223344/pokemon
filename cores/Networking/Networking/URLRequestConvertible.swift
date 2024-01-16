//
//  URLRequestConvertible.swift
//  Networking
//
//  Created by Andy ⠀ on 05/01/24.
//

import Foundation

public protocol URLRequestConvertible {
    func asURLRequest() throws -> URLRequest
}
