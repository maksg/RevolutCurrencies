//
//  RequestTests.swift
//  RevolutCurrenciesTests
//
//  Created by Maksymilian Galas on 21/11/2018.
//  Copyright © 2018 Infinity Pi Ltd. All rights reserved.
//

import XCTest
@testable import RevolutCurrencies

class RequestTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRequestThrows() {
        let request = Request(withURL: "...\\")
        XCTAssertEqual(request.apiURL, "...\\")
        
        XCTAssertNil(request.endpoint)
        XCTAssertThrowsError(try request.getRequest(), "") { (error) in
            let error = error as? RequestError
            XCTAssertNotNil(error)
            XCTAssertEqual(error, RequestError.invalidEndpoint)
        }
        
        request.endpoint = Endpoint.getCurrencies(base: CurrencyName.AUD)
        XCTAssertNotNil(request.endpoint)
        XCTAssertThrowsError(try request.getRequest(), "") { (error) in
            let error = error as? RequestError
            XCTAssertNotNil(error)
            XCTAssertEqual(error, RequestError.invalidUrl)
        }
    }
    
    func testRequestForGetCurrencies() {
        let url = "http://getcurrencies.com"
        let endpoint = Endpoint.getCurrencies(base: CurrencyName.AUD)
        let request = Request(withURL: url)
        request.endpoint = endpoint
        let urlRequest = try! request.getRequest()
        
        XCTAssertEqual(request.apiURL, url)
        XCTAssertEqual(request.endpoint, endpoint)
        XCTAssertEqual(urlRequest.url?.absoluteString, "\(url)/latest?base=AUD")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
        XCTAssertEqual(urlRequest.allHTTPHeaderFields, ["Content-Type" : "application/json"])
        XCTAssertNil(urlRequest.httpBody)
    }

}
