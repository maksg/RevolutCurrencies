//
//  APIRequestTests.swift
//  RevolutCurrenciesTests
//
//  Created by Maksymilian Galas on 21/11/2018.
//  Copyright © 2018 Infinity Pi Ltd. All rights reserved.
//

import XCTest
@testable import RevolutCurrencies

class APIRequestTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetCurrencies() {
        let currency1 = Currency(name: CurrencyName.AUD, exchangeRate: 2.0)
        let currency2 = Currency(name: CurrencyName.BGN, exchangeRate: 1.0)
        let currency3 = Currency(name: CurrencyName.CAD, exchangeRate: 3.4)
        let currenciesData = CurrenciesData(base: CurrencyName.EUR, date: Date(), rates: [currency1, currency2, currency3])
        let request = RequestMock(withURL: "http://apple.com/")
        request.responseData = currenciesData
        let apiRequest = APIRequest(withRequest: request)
        apiRequest.getCurrencies(baseCurrency: CurrencyName.EUR) { (responseData, error) in
            XCTAssertEqual(responseData?.base, currenciesData.base)
            XCTAssertEqual(responseData?.date, currenciesData.date)
            XCTAssertEqual(responseData?.rates.count, currenciesData.rates.count)
            XCTAssertNil(error)
        }
    }

}
