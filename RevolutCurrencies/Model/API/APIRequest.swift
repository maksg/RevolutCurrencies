//
//  APIRequest.swift
//  RevolutCurrencies
//
//  Created Maksymilian Galas on 20/01/2019.
//  Copyright © 2019 Infinity Pi Ltd. All rights reserved.
//

import Foundation

class APIRequest: APIRequestProtocol {
    
    // MARK: Private Properties
    
    private var request: RequestProtocol
    
    // MARK: Initialization
    
    init(withRequest request: RequestProtocol) {
        self.request = request
    }
    
    // MARK: Methods
    
    func getCurrencies(baseCurrency: CurrencyName, completionHandler: @escaping (CurrenciesData?, Error?) -> Void) {
        self.request.endpoint =  .getCurrencies(base: baseCurrency)
        self.request.makeRequest(completionHandler: completionHandler)
    }
    
}
