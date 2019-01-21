//
//  CurrencyTests.swift
//  RevolutCurrenciesTests
//
//  Created by Maksymilian Galas on 21/01/2019.
//  Copyright © 2019 Infinity Pi Ltd. All rights reserved.
//

import XCTest
@testable import RevolutCurrencies

class CurrencyTests: XCTestCase {
    
    var currency: Currency!

    override func setUp() {
        super.setUp()
        
        self.currency = Currency(name: CurrencyName.AUD, exchangeRate: 2.0)
    }

    override func tearDown() {
        self.currency = nil
        
        super.tearDown()
    }

    func testCurrency() {
        XCTAssertEqual(self.currency.name, CurrencyName.AUD)
        XCTAssertEqual(self.currency.exchangeRate, 2.0)
    }

}
