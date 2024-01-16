//
//  NetworkError.swift
//  Networking
//
//  Created by Andy ⠀ on 05/01/24.
//

import Foundation

public enum ErrorResult: Error, Equatable {
    case errMessage(message: String?)
    case noInternet
    case dataNil
    case parsingFailure
    case unknown
    case invalidUrl
}
