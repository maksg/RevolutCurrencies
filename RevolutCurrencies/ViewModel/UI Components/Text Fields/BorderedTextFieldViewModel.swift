//
//  BorderedTextFieldViewModel.swift
//  FilingCabinet
//
//  Created by Maksymilian Galas on 23/10/2018.
//  Copyright © 2018 Arcsoft Sp. z o.o. All rights reserved.
//

import UIKit

class BorderedTextFieldViewModel: TextFieldViewModel {
    
    // MARK: Private(set) - Properties
    
    private(set) var bordered: Bordered?
    
    // MARK: ViewModel - Initialization
    
    required init(withInjector injector: InjectorProtocol) {
        super.init(withInjector: injector)
    }
    
    // MARK: Initialization
    
    init(withBordered bordered: Bordered? = nil, withProperties properties: TextFieldProperties) {
        super.init(withProperties: properties)
        
        self.bordered = bordered
    }
    
}
