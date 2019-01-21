//
//  Translation.swift
//  RevolutCurrencies
//
//  Created Maksymilian Galas on 20/01/2019.
//  Copyright © 2019 Infinity Pi Ltd. All rights reserved.
//

import Foundation

class Translation {
    
    enum Alert: String {
        case confirm = "alert_confirm"
        case cancel = "alert_cancel"
    }
    
    enum Error: String {
        case title = "error_title"
        case `default` = "error_default"
        case invalidUrl = "error_invalid_url"
        case invalidEndpoint = "error_invalid_endpoint"
    }
    
    enum Currencies: String {
        case title = "currencies_title"
    }
    
}

