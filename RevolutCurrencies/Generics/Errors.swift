//
//  Errors.swift
//  RevolutCurrencies
//
//  Created Maksymilian Galas on 20/01/2019.
//  Copyright © 2019 Infinity Pi Ltd. All rights reserved.
//

import Foundation

enum RequestError: Error, LocalizedError {
    case invalidUrl
    case invalidEndpoint
    
    public var errorDescription: String? {
        get {
            switch self {
            case .invalidUrl:
                return Translation.Error.invalidUrl.localized
            case .invalidEndpoint:
                return Translation.Error.invalidEndpoint.localized
            }
        }
    }
}

enum ResponseError: Error, LocalizedError {
    case somethingHappened(errorCode: Int)
    
    public var errorDescription: String? {
        get {
            switch self {
            case .somethingHappened(let errorCode):
                return "\(Translation.Error.default.localized) (\(errorCode))"
            }
        }
    }
}
