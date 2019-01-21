//
//  APIRequestProtocol.swift
//  RevolutCurrencies
//
//  Created Maksymilian Galas on 20/01/2019.
//  Copyright © 2019 Infinity Pi Ltd. All rights reserved.
//

import Foundation

protocol APIRequestProtocol {
    
    func getCurrencies(baseCurrency: CurrencyName, completionHandler: @escaping (CurrenciesData?, Error?) -> Void)
    
}
