//
//  InjectorMock.swift
//  RevolutCurrenciesTests
//
//  Created by Maksymilian Galas on 22/11/2018.
//  Copyright © 2018 Infinity Pi Ltd. All rights reserved.
//

import Foundation

class InjectorMock: InjectorProtocol {
    
    // MARK: Properties
    
    var apiRequest: APIRequestProtocol
    
    // MARK: Initialization
    
    init(withApiRequest apiRequest: APIRequestProtocol) {
        self.apiRequest = apiRequest
    }
    
}
