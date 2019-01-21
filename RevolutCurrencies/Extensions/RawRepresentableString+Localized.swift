//
//  RawRepresentableString+Localized.swift
//  RevolutCurrencies
//
//  Created Maksymilian Galas on 20/01/2019.
//  Copyright © 2019 Infinity Pi Ltd. All rights reserved.
//

import Foundation

extension RawRepresentable where RawValue == String {
    
    var localized: String {
        return rawValue.localized
    }
    
}
