//
//  InjectorTests.swift
//  RevolutCurrenciesTests
//
//  Created by Maksymilian Galas on 21/11/2018.
//  Copyright © 2018 Infinity Pi Ltd. All rights reserved.
//

import XCTest
@testable import RevolutCurrencies

class InjectorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitialization() {
        let request = RequestMock(withURL: "http://apple.com/")
        let apiRequest = APIRequest(withRequest: request)
        let injector = Injector(apiRequest: apiRequest)
        XCTAssertTrue(injector.apiRequest as? APIRequest === apiRequest)
    }

}
