//
//  Currency.swift
//  RevolutCurrencies
//
//  Created by Maksymilian Galas on 21/01/2019.
//  Copyright © 2019 Infinity Pi Ltd. All rights reserved.
//

import Foundation

struct Currency: Codable, Equatable {
    
    var name: CurrencyName
    var exchangeRate: Double
    
}
