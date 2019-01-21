//
//  CurrenciesCellViewModel.swift
//  RevolutCurrencies
//
//  Created by Maksymilian Galas on 21/01/2019.
//  Copyright © 2019 Infinity Pi Ltd. All rights reserved.
//

import UIKit

protocol CurrenciesCellViewModelExternalDelegate: class {
    func currenciesCellViewModel(_ viewModel: CurrenciesCellViewModel, didUpdateCurrencyWithValue value: Double)
    func currenciesCellViewModelDidBecomeFirstResponder(_ viewModel: CurrenciesCellViewModel)
}

protocol CurrenciesCellViewModelDelegate: class {
    func currenciesCellViewModelBecomeFirstResponder(_ viewModel: CurrenciesCellViewModel)
}

class CurrenciesCellViewModel: ViewModel, TextFieldViewModelDelegate {
    
    // MARK: ViewModel - Properties
    
    let injector: InjectorProtocol?
    
    // MARK: Properties
    
    var name: String? {
        get {
            return self.currency?.name.rawValue
        }
    }
    
    var value: String? {
        get {
            if let exchangeRate = self.currency?.exchangeRate {
                return "\(exchangeRate * self.mainCurrencyValue)"
            }
            return nil
        }
    }
    
    // MARK: Private(set) - Properties
    
    private(set) var currency: Currency?
    private(set) var mainCurrencyValue: Double
    
    private(set) var valueTextFieldViewModel: BorderedTextFieldViewModel
    
    // MARK: Properties
    
    weak var delegate: CurrenciesCellViewModelDelegate?
    weak var externalDelegate: CurrenciesCellViewModelExternalDelegate?
    
    // MARK: ViewModel - Initialization
    
    required init(withInjector injector: InjectorProtocol) {
        self.injector = injector
        self.mainCurrencyValue = 1.0
        self.valueTextFieldViewModel = BorderedTextFieldViewModel(withProperties: TextFieldProperties())
        self.valueTextFieldViewModel.externalDelegate = self
    }
    
    // MARK: Initialization
    
    init(withCurrency currency: Currency?) {
        self.injector = nil
        self.currency = currency
        self.mainCurrencyValue = 1.0
        var bordered = Bordered()
        bordered.side = .bottom
        var properties = TextFieldProperties()
        properties.placeholder = "0"
        properties.font = UIFont.boldSystemFont(ofSize: 22.0)
        properties.text = "\(currency?.exchangeRate ?? 0.0)"
        self.valueTextFieldViewModel = BorderedTextFieldViewModel(withBordered: bordered, withProperties: properties)
        self.valueTextFieldViewModel.externalDelegate = self
    }
    
    // MARK: Methods
    
    func update(mainCurrencyValue: Double) {
        self.mainCurrencyValue = mainCurrencyValue
        self.valueTextFieldViewModel.setValue(value)
    }
    
    func becomeFirstResponder() {
        self.delegate?.currenciesCellViewModelBecomeFirstResponder(self)
    }
    
    // MARK: TextFieldViewModelDelegate
    
    func textFieldViewModel(_ viewModel: TextFieldViewModel, didChangeIsEnabled isEnabled: Bool) {
    }
    
    func textFieldViewModel(_ viewModel: TextFieldViewModel, didChangeValue value: String?) {
        if let exchangeRate = self.currency?.exchangeRate {
            let value = Double(value ?? "") ?? 0.0
            self.externalDelegate?.currenciesCellViewModel(self, didUpdateCurrencyWithValue: value/exchangeRate)
        }
    }
    
    func textFieldViewModelDidBecomeFirstResponder(_ viewModel: TextFieldViewModel) {
        self.externalDelegate?.currenciesCellViewModelDidBecomeFirstResponder(self)
    }
    
}

