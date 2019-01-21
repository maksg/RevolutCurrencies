//
//  Injector.swift
//  RevolutCurrencies
//
//  Created Maksymilian Galas on 20/01/2019.
//  Copyright © 2019 Infinity Pi Ltd. All rights reserved.
//

import Foundation

class Injector: InjectorProtocol {
    
    // MARK: Properties
    
    private(set) var apiRequest: APIRequestProtocol
    
    // MARK: Initialization
    
    init(apiRequest: APIRequestProtocol) {
        self.apiRequest = apiRequest
    }
    
}
