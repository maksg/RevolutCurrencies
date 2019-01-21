//
//  CurrenciesData.swift
//  RevolutCurrencies
//
//  Created by Maksymilian Galas on 20/01/2019.
//  Copyright © 2019 Infinity Pi Ltd. All rights reserved.
//

import Foundation

struct CurrenciesData: ResponseDataProtocol {
    
    var base: CurrencyName
    var date: Date
    var rates: [Currency]
    
    init(base: CurrencyName, date: Date, rates: [Currency]) {
        self.base = base
        self.date = date
        self.rates = rates
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.base = try values.decode(CurrencyName.self, forKey: .base)
        self.date = try values.decode(Date.self, forKey: .date)
        let ratesDictionary = try values.decode([String : Double].self, forKey: .rates)
        self.rates = ratesDictionary.map { Currency(name: CurrencyName(rawValue: $0.key)!, exchangeRate: $0.value) }
    }
    
}
