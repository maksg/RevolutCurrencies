//
//  RequestProtocol.swift
//  RevolutCurrencies
//
//  Created Maksymilian Galas on 20/01/2019.
//  Copyright © 2019 Infinity Pi Ltd. All rights reserved.
//

import Foundation

protocol RequestProtocol {
    
    // MARK: Properties
    
    var apiURL: String { get }
    var endpoint: Endpoint! { get set }
    
    // MARK: Initialization
    
    init(withURL apiUrl: String)
    
    // MARK: Methods
    
    func makeRequest(completionHandler: @escaping (Error?) -> Void)
    func makeRequest<ResponseData: ResponseDataProtocol>(completionHandler: @escaping (ResponseData?, Error?) -> Void)
    
}
