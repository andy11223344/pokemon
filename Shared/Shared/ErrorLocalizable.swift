//
//  ErrorLocalizable.swift
//  Shared
//
//  Created by Andy ⠀ on 16/01/24.
//

import Foundation
import Networking

extension ErrorResult: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .errMessage(let message):
            return message
        case .noInternet:
            return "No Internet Connection"
        case .dataNil:
            return "No Data"
        case .parsingFailure:
            return "Something Went Wrong"
        case .unknown:
            return "Something Went Wrong"
        case .invalidUrl:
            return "Something Went Wrong"
        }
    }
}
