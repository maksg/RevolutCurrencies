//
//  Request.swift
//  RevolutCurrencies
//
//  Created Maksymilian Galas on 20/01/2019.
//  Copyright © 2019 Infinity Pi Ltd. All rights reserved.
//

import Foundation

class Request: RequestProtocol {
    
    // MARK: Properties
    
    let apiURL: String
    var endpoint: Endpoint!
    
    // MARK: RequestProtocol - Initialization
    
    required init(withURL apiUrl: String) {
        self.apiURL = apiUrl
    }
    
    // MARK: Methods
    
    func getRequest() throws -> URLRequest {
        guard self.endpoint != nil else {
            throw RequestError.invalidEndpoint
        }
        
        let method = self.endpoint.method
        let parameters = self.endpoint.parameters
        var headers = self.endpoint.headers
        headers["Content-Type"] = "application/json"
        
        var urlComponents = URLComponents(string: self.apiURL)
        urlComponents?.path = self.endpoint.path
        
        if method == .get {
            if parameters.count > 0 {
                urlComponents?.queryItems = parameters.map({ URLQueryItem(name: $0.key, value: String(describing: $0.value)) })
            }
        }
        
        guard let url = urlComponents?.url else {
            throw RequestError.invalidUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        
        if method != .get {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        }
        
        return request
    }
    
    // MARK: Methods
    
    func makeRequest(completionHandler: @escaping (Error?) -> Void) {
        let request: URLRequest
        do {
            request = try self.getRequest()
        }
        catch {
            completionHandler(error)
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            var error: Error? = error
            
            if let httpResponse = response as? HTTPURLResponse,
                300...500 ~= httpResponse.statusCode {
                error = ResponseError.somethingHappened(errorCode: httpResponse.statusCode)
            }
            
            DispatchQueue.main.async {
                completionHandler(error)
            }
        }
        
        task.resume()
    }
    
    func makeRequest<ResponseData: ResponseDataProtocol>(completionHandler: @escaping (ResponseData?, Error?) -> Void) {
        let request: URLRequest
        do {
            request = try self.getRequest()
        }
        catch {
            completionHandler(nil, error)
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            var error: Error? = error
            
            if let httpResponse = response as? HTTPURLResponse,
                300...500 ~= httpResponse.statusCode {
                error = ResponseError.somethingHappened(errorCode: httpResponse.statusCode)
            }
            
            if let error = error {
                print(error)
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
            }
            else {
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print(json)
                        
                        let formatter = DateFormatter()
                        formatter.dateFormat = "yyyy-MM-dd"
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .formatted(formatter)
                        
                        let responseData = try decoder.decode(ResponseData.self, from: data)
                        DispatchQueue.main.async {
                            completionHandler(responseData, nil)
                        }
                    }
                    catch {
                        print(error)
                        DispatchQueue.main.async {
                            completionHandler(nil, error)
                        }
                    }
                }
                else {
                    DispatchQueue.main.async {
                        completionHandler(nil, nil)
                    }
                }
            }
        }
        
        task.resume()
    }
    
}
