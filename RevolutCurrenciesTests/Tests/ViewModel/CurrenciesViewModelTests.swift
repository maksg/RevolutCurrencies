//
//  CurrenciesViewModelTests.swift
//  RevolutCurrenciesTests
//
//  Created by Maksymilian Galas on 22/11/2018.
//  Copyright © 2018 Infinity Pi Ltd. All rights reserved.
//

import XCTest
@testable import RevolutCurrencies

class CurrenciesViewModelTests: XCTestCase {
    
    var injector: InjectorMock!
    var currencies: [Currency]!
    
    var viewModel: CurrenciesViewModel!
    
    override func setUp() {
        super.setUp()
        
        let currency1 = Currency(name: CurrencyName.AUD, exchangeRate: 2.0)
        let currency2 = Currency(name: CurrencyName.BGN, exchangeRate: 1.0)
        let currency3 = Currency(name: CurrencyName.CAD, exchangeRate: 3.4)
        let currenciesData = CurrenciesData(base: CurrencyName.EUR, date: Date(), rates: [currency1, currency2, currency3])
        let request = RequestMock(withURL: "http://apple.com/")
        request.responseData = currenciesData
        let apiRequest = APIRequest(withRequest: request)
        
        self.injector = InjectorMock(withApiRequest: apiRequest)
        self.viewModel = CurrenciesViewModel(withInjector: self.injector)
    }
    
    override func tearDown() {
        self.viewModel = nil
        
        super.tearDown()
    }
    
    func testInitialization() {
        XCTAssertTrue(self.viewModel.injector as? InjectorMock === self.injector)
        XCTAssertEqual(self.viewModel.currencies.count, 0)
        XCTAssertEqual(self.viewModel.currencyViewModels.count, 0)
        XCTAssertNil(self.viewModel.delegate)
    }
    
    func testGetCurrencies() {
        XCTAssertEqual(self.viewModel.currencies.count, 0)
        XCTAssertEqual(self.viewModel.currencyViewModels.count, 0)

        self.viewModel.getCurrencies()
        XCTAssertEqual(self.viewModel.currencies.count, 4)
        XCTAssertEqual(self.viewModel.currencyViewModels.count, 4)
    }
    
    func testMoveViewModel() {
        self.viewModel.getCurrencies()
        XCTAssertEqual(self.viewModel.currencies[0].name, CurrencyName.EUR)
        XCTAssertEqual(self.viewModel.currencyViewModels[0].name, "EUR")
        
        _ = self.viewModel.moveViewModel(atRow: 2, toRow: 0)
        XCTAssertNotEqual(self.viewModel.currencies[0].name, CurrencyName.EUR)
        XCTAssertNotEqual(self.viewModel.currencyViewModels[0].name, "EUR")
    }

}
