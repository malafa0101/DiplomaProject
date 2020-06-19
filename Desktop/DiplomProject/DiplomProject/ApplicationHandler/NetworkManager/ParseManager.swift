//
//  ParseManager.swift
//  DiplomProject
//
//  Created by Zhanibek Santay on 6/19/20.
//  Copyright © 2020 Zhanibek Santay. All rights reserved.
//

import Foundation

class ParseManager {
    
    static let shared = ParseManager()
    
    let networkManager: NetworkManager = Router(parser: DefaultParserImpl())
    
    private init() {}
    
    func multipartFormData<T: Decodable>(url: String, parameters: Parameters? = nil,
                                         success: @escaping (T) -> (), error: @escaping (String) -> ()) {
        let endpoint = Endpoints.multipartFormData(url: url, parameters: parameters, token: UserManager.getCurrentToken())
        let dispatch = DispatchQueue.global(qos: .utility)
        dispatch.async {
            self.networkManager.request(endpoint) { (result: Result<GeneralResult<T>>) in
                DispatchQueue.main.async {
                    switch result {
                    case .failure(let errorMessage):
                        error(errorMessage)
                    case .success(let value):
                        success(value.result)
                    }
                }
            }
        }
    }
    
    func postRequest<T: Decodable>(url: String, parameters: Parameters? = nil, token: String? = UserManager.getCurrentToken(), success: @escaping (T) -> (), error: @escaping (String) -> ()) {
        let endpoint = Endpoints.post(url: url, parameters: parameters, token: token)
        self.networkManager.request(endpoint) { (result: Result<T>) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let errorMessage):
                    error(errorMessage)
                case .success(let value):
                    success(value)
                }
            }
        }
    }
    
    func putRequest<T: Decodable>(url: String, parameters: Parameters? = nil, token: String? = UserManager.getCurrentToken(), header: HTTPHeaders = [:], success: @escaping (T) -> (), error: @escaping (String) -> ()) {
        let endpoint = Endpoints.put(url: url, parameters: parameters, token: token, header: header)
        self.networkManager.request(endpoint) { (result: Result<T>) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let errorMessage):
                    error(errorMessage)
                case .success(let value):
                    success(value)
                }
            }
        }
    }

    func getRequest<T: Decodable>(url: String, parameters: Parameters? = nil, token: String? = UserManager.getCurrentToken(),
                                  success: @escaping (T) -> (), error: @escaping (String) -> ()) {
        let endpoint = Endpoints.get(url: url, parameters: parameters, token: token)
        
        self.networkManager.request(endpoint) { (result: Result<T>) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let errorMessage):
                    error(errorMessage)
                case .success(let value):
                    success(value)
                }
            }
        }
    }
    
    func deleteRequest<T: Decodable>(url: String, parameters: Parameters? = nil, url_parameters: Parameters? = nil,
                                   success: @escaping (T) -> (), error: @escaping (String) -> ()) {
        let endpoint = Endpoints.delete(url: url, parameters: nil, url_parameters: url_parameters, token: UserManager.getCurrentToken())
        self.networkManager.request(endpoint) { (result: Result<GeneralResult<T>>) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let errorMessage):
                    error(errorMessage)
                case .success(let value):
                    success(value.result)
                }
            }
        }
    }
   
}

