//
//  Endpoint.swift
//  RevolutCurrencies
//
//  Created Maksymilian Galas on 20/01/2019.
//  Copyright © 2019 Infinity Pi Ltd. All rights reserved.
//

import Foundation

enum Endpoint: Equatable {
    
    case getCurrencies(base: CurrencyName)
    
    var headers: [String : String] {
        get {
            switch self {
            default:
                return [:]
            }
        }
    }
    
    var parameters: [String : Any] {
        get {
            switch self {
            case .getCurrencies(let base):
                return ["base" : base]
            }
        }
    }
    
    var path: String {
        get {
            switch self {
            case .getCurrencies:
                return "/latest"
            }
        }
    }
    
    var method: HTTPMethod {
        get {
            switch self {
            case .getCurrencies:
                return .get
            }
        }
    }
    
}
