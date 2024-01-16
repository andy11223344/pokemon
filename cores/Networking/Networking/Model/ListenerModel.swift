//
//  ListenerModel.swift
//  Networking
//
//  Created by Andy ⠀ on 13/01/24.
//

import Foundation

public struct ServiceListener<T: Codable> {
    
    public var onSuccess: (ResponseModel<T>) -> Void
    public var onFailed: (String) -> Void
    public var onFailedWithModel: ((ResponseModel<T>) -> Void)?
    public var onInvalidCredential: ((InvalidationType) -> Void)?
    public var onOtherFailure: ((Error) -> Void)?
    
    public init(onSuccess: @escaping (ResponseModel<T>) -> Void, onFailed: @escaping (String) -> Void, onInvalidCredential: ((InvalidationType) -> Void)? = nil, onOtherFailure: ((Error) -> Void)? = nil, onFailedWithModel: ((ResponseModel<T>) -> Void)? = nil) {
        self.onSuccess = onSuccess
        self.onFailed = onFailed
        self.onFailedWithModel = onFailedWithModel
        self.onInvalidCredential = onInvalidCredential
        self.onOtherFailure = onOtherFailure
    }
}

public enum InvalidationType {
    case expired(message: String)
    case refresh(message: String)
}

public class ResponseModel<T: Decodable>: Decodable {
    public var success: Bool?
    public var code: Int?
    public var errorCredential: Bool?
    public var message: String?
    public var data: T?
    
    enum CodingKeys: String, CodingKey {
        case errorCredential = "error_credential"
        case success
        case code
        case message
        case data
    }
    
    public init(data: T?) {
        self.data = data
    }
    
    public init(message: String, code: Int, errorCredential: Bool) {
        self.message = message
        self.code = code
        self.errorCredential = errorCredential
    }
}
