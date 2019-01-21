//
//  CurrenciesViewModel.swift
//  RevolutCurrencies
//
//  Created Maksymilian Galas on 20/01/2019.
//  Copyright © 2019 Infinity Pi Ltd. All rights reserved.
//

import UIKit

protocol CurrenciesViewModelDelegate: class {
    func currenciesViewModel(_ viewModel: CurrenciesViewModel, didGetCurrenciesWithError error: Error?)
    func currenciesViewModel(_ viewModel: CurrenciesViewModel, cellDidBecomeFirstResponderAtIndex index: Int)
}

class CurrenciesViewModel: ViewModel, CurrenciesCellViewModelExternalDelegate {
    
    // MARK: ViewModel - Properties
    
    let injector: InjectorProtocol?
    
    // MARK: Private - Properties
    
    private var isUpdatingCurrencies: Bool
    
    // MARK: Private(set) - Properties
    
    private(set) var currencies: [Currency]
    
    // MARK: Properties
    
    var currencyViewModels: [CurrenciesCellViewModel]
    
    weak var delegate: CurrenciesViewModelDelegate?
    
    // MARK: ViewModel - Initialization
    
    required init(withInjector injector: InjectorProtocol) {
        self.injector = injector
        self.currencies = []
        self.currencyViewModels = []
        self.isUpdatingCurrencies = false
    }
    
    // MARK: Methods
    
    func getCurrencies() {
        self.injector?.apiRequest.getCurrencies(baseCurrency: CurrencyName.EUR, completionHandler: { (currenciesData, error) in
            if let error = error {
                self.delegate?.currenciesViewModel(self, didGetCurrenciesWithError: error)
            }
            else {
                self.currencies = currenciesData?.rates ?? []
                self.currencies.insert(Currency(name: CurrencyName.EUR, exchangeRate: 1.0), at: 0)
                
                self.currencyViewModels = self.currencies.map {
                    let viewModel = CurrenciesCellViewModel(withCurrency: $0)
                    viewModel.externalDelegate = self
                    return viewModel
                }
                
                self.delegate?.currenciesViewModel(self, didGetCurrenciesWithError: nil)
            }
        })
    }
    
    func moveViewModel(atRow: Int, toRow: Int) -> CurrenciesCellViewModel {
        let viewModel = self.currencyViewModels.remove(at: atRow)
        self.currencyViewModels.insert(viewModel, at: toRow)
        
        let currency = self.currencies.remove(at: atRow)
        self.currencies.insert(currency, at: toRow)
        
        return viewModel
    }
    
    // MARK: CurrenciesCellViewModelDelegate
    
    func currenciesCellViewModel(_ viewModel: CurrenciesCellViewModel, didUpdateCurrencyWithValue value: Double) {
        if !self.isUpdatingCurrencies {
            self.isUpdatingCurrencies = true
            for currencyViewModel in self.currencyViewModels {
                if viewModel.currency?.name != currencyViewModel.currency?.name {
                    currencyViewModel.update(mainCurrencyValue: value)
                }
            }
            self.isUpdatingCurrencies = false
        }
    }
    
    func currenciesCellViewModelDidBecomeFirstResponder(_ viewModel: CurrenciesCellViewModel) {
        let index = self.currencyViewModels.firstIndex { $0.currency?.name == viewModel.currency?.name } ?? 0
        self.delegate?.currenciesViewModel(self, cellDidBecomeFirstResponderAtIndex: index)
    }
    
}
