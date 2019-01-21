//
//  CurrenciesCellViewModelTests.swift
//  RevolutCurrenciesTests
//
//  Created by Maksymilian Galas on 21/11/2018.
//  Copyright © 2018 Infinity Pi Ltd. All rights reserved.
//

import XCTest
@testable import RevolutCurrencies

class CurrenciesCellViewModelTests: XCTestCase {
    
    var injector: InjectorMock!
    var currency: Currency!
    
    var viewModel: CurrenciesCellViewModel!
    var viewModelWithCurrency: CurrenciesCellViewModel!

    override func setUp() {
        super.setUp()
        
        let request = RequestMock(withURL: "http://apple.com/")
        let apiRequest = APIRequestMock(withRequest: request)
        self.injector = InjectorMock(withApiRequest: apiRequest)
        self.viewModel = CurrenciesCellViewModel(withInjector: self.injector)
        
        self.currency = Currency(name: CurrencyName.AUD, exchangeRate: 2.0)
        self.viewModelWithCurrency = CurrenciesCellViewModel(withCurrency: self.currency)
    }

    override func tearDown() {
        self.viewModel = nil
        self.viewModelWithCurrency = nil
        
        super.tearDown()
    }

    func testInitialization() {
        XCTAssertTrue(self.viewModel.injector as? InjectorMock === self.injector)
        XCTAssertNil(self.viewModel.currency)
        
        XCTAssertNil(self.viewModelWithCurrency.injector)
        XCTAssertEqual(self.viewModelWithCurrency.currency, self.currency)
    }
    
    func testName() {
        XCTAssertNil(self.viewModel.name)
        XCTAssertEqual(self.viewModelWithCurrency.name, "AUD")
    }
    
    func testValue() {
        XCTAssertNil(self.viewModel.value)
        XCTAssertEqual(self.viewModelWithCurrency.value, "2.0")
    }

}
