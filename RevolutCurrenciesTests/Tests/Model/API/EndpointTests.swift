//
//  EndpointTests.swift
//  RevolutCurrenciesTests
//
//  Created by Maksymilian Galas on 21/11/2018.
//  Copyright © 2018 Infinity Pi Ltd. All rights reserved.
//

import XCTest
@testable import RevolutCurrencies

class EndpointTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetCurrencies() {
        let endpoint = Endpoint.getCurrencies(base: CurrencyName.AUD)
        XCTAssertEqual(endpoint.headers, [:])
        XCTAssertEqual(endpoint.parameters.count, 1)
        XCTAssertEqual(endpoint.parameters as? [String : CurrencyName], ["base" : CurrencyName.AUD])
        XCTAssertEqual(endpoint.path, "/latest")
        XCTAssertEqual(endpoint.method, .get)
    }

}
