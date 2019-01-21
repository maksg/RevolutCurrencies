//
//  TranslationTests.swift
//  RevolutCurrenciesTests
//
//  Created by Maksymilian Galas on 21/11/2018.
//  Copyright © 2018 Infinity Pi Ltd. All rights reserved.
//

import XCTest
@testable import RevolutCurrencies

class TranslationTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAlert() {
        XCTAssertEqual(Translation.Alert.confirm.rawValue, "alert_confirm")
        XCTAssertEqual(Translation.Alert.cancel.rawValue, "alert_cancel")
    }
    
    func testError() {
        XCTAssertEqual(Translation.Error.title.rawValue, "error_title")
        XCTAssertEqual(Translation.Error.default.rawValue, "error_default")
        XCTAssertEqual(Translation.Error.invalidUrl.rawValue, "error_invalid_url")
        XCTAssertEqual(Translation.Error.invalidEndpoint.rawValue, "error_invalid_endpoint")
    }
    
    func testCurrencies() {
        XCTAssertEqual(Translation.Currencies.title.rawValue, "currencies_title")
    }

}
