//
//  TextFieldViewModel.swift
//  FilingCabinet
//
//  Created by Maksymilian Galas on 16/09/2018.
//  Copyright © 2018 Arcsoft Sp. z o.o. All rights reserved.
//

import UIKit

protocol TextFieldViewModelDelegate: class {
    func textFieldViewModel(_ viewModel: TextFieldViewModel, didChangeIsEnabled isEnabled: Bool)
    func textFieldViewModel(_ viewModel: TextFieldViewModel, didChangeValue value: String?)
    func textFieldViewModelDidBecomeFirstResponder(_ viewModel: TextFieldViewModel)
}

class TextFieldViewModel: ViewModel {
    
    // MARK: Private(set) - Properties
    
    private(set) var properties: TextFieldProperties
    
    private(set) var value: String?
    
    // MARK: Properties
    
    var textLeftMargin: CGFloat = 10.0
    var textRightMargin: CGFloat = 10.0
    
    var isEnabled: Bool = true {
        didSet {
            self.delegate?.textFieldViewModel(self, didChangeIsEnabled: self.isEnabled)
            self.externalDelegate?.textFieldViewModel(self, didChangeIsEnabled: self.isEnabled)
        }
    }
    
    weak var delegate: TextFieldViewModelDelegate?
    weak var externalDelegate: TextFieldViewModelDelegate?
    
    // MARK: ViewModel - Properties
    
    let injector: InjectorProtocol?
    
    // MARK: ViewModel - Initialization
    
    required init(withInjector injector: InjectorProtocol) {
        self.injector = injector
        self.properties = TextFieldProperties()
    }
    
    // MARK: Initialization
    
    init(withProperties properties: TextFieldProperties) {
        self.injector = nil
        self.properties = properties
        self.value = properties.text
    }
    
    // MARK: Methods
    
    func setValue(_ value: String?) {
        if value != self.value {
            self.delegate?.textFieldViewModel(self, didChangeValue: value)
            self.externalDelegate?.textFieldViewModel(self, didChangeValue: value)
            self.properties.text = value
            self.value = value
        }
    }
    
    func becomeFirstResponder() {
        self.delegate?.textFieldViewModelDidBecomeFirstResponder(self)
        self.externalDelegate?.textFieldViewModelDidBecomeFirstResponder(self)
    }
    
}
