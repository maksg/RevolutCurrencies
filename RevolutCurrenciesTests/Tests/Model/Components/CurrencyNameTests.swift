//
//  CurrencyNameTests.swift
//  RevolutCurrenciesTests
//
//  Created by Maksymilian Galas on 21/11/2018.
//  Copyright © 2018 Infinity Pi Ltd. All rights reserved.
//

import XCTest
@testable import RevolutCurrencies

class CurrencyNameTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCurrencyName() {
        XCTAssertEqual(CurrencyName.AUD.rawValue, "AUD")
        XCTAssertEqual(CurrencyName.BGN.rawValue, "BGN")
        XCTAssertEqual(CurrencyName.BRL.rawValue, "BRL")
        XCTAssertEqual(CurrencyName.CAD.rawValue, "CAD")
        XCTAssertEqual(CurrencyName.CHF.rawValue, "CHF")
        XCTAssertEqual(CurrencyName.CNY.rawValue, "CNY")
        XCTAssertEqual(CurrencyName.CZK.rawValue, "CZK")
        XCTAssertEqual(CurrencyName.DKK.rawValue, "DKK")
        XCTAssertEqual(CurrencyName.EUR.rawValue, "EUR")
        XCTAssertEqual(CurrencyName.GBP.rawValue, "GBP")
        XCTAssertEqual(CurrencyName.HKD.rawValue, "HKD")
        XCTAssertEqual(CurrencyName.HRK.rawValue, "HRK")
        XCTAssertEqual(CurrencyName.HUF.rawValue, "HUF")
        XCTAssertEqual(CurrencyName.IDR.rawValue, "IDR")
        XCTAssertEqual(CurrencyName.ILS.rawValue, "ILS")
        XCTAssertEqual(CurrencyName.INR.rawValue, "INR")
        XCTAssertEqual(CurrencyName.ISK.rawValue, "ISK")
        XCTAssertEqual(CurrencyName.JPY.rawValue, "JPY")
        XCTAssertEqual(CurrencyName.KRW.rawValue, "KRW")
        XCTAssertEqual(CurrencyName.MXN.rawValue, "MXN")
        XCTAssertEqual(CurrencyName.MYR.rawValue, "MYR")
        XCTAssertEqual(CurrencyName.NOK.rawValue, "NOK")
        XCTAssertEqual(CurrencyName.NZD.rawValue, "NZD")
        XCTAssertEqual(CurrencyName.PHP.rawValue, "PHP")
        XCTAssertEqual(CurrencyName.PLN.rawValue, "PLN")
        XCTAssertEqual(CurrencyName.RON.rawValue, "RON")
        XCTAssertEqual(CurrencyName.RUB.rawValue, "RUB")
        XCTAssertEqual(CurrencyName.SEK.rawValue, "SEK")
        XCTAssertEqual(CurrencyName.SGD.rawValue, "SGD")
        XCTAssertEqual(CurrencyName.THB.rawValue, "THB")
        XCTAssertEqual(CurrencyName.TRY.rawValue, "TRY")
        XCTAssertEqual(CurrencyName.USD.rawValue, "USD")
        XCTAssertEqual(CurrencyName.ZAR.rawValue, "ZAR")
    }

}
