//
//  APIRequestMock.swift
//  RevolutCurrencies
//
//  Created by Maksymilian Galas on 22/11/2018.
//  Copyright © 2018 Infinity Pi Ltd. All rights reserved.
//

import Foundation

class APIRequestMock: APIRequestProtocol {
    
    // MARK: Properties
    
    var request: RequestProtocol
    
    // MARK: Initialization
    
    init(withRequest request: RequestProtocol) {
        self.request = request
    }
    
    // MARK: Methods
    
    func getCurrencies(baseCurrency: CurrencyName, completionHandler: @escaping (CurrenciesData?, Error?) -> Void) {
        request.endpoint = .getCurrencies(base: baseCurrency)
        request.makeRequest(completionHandler: completionHandler)
    }
    
}
