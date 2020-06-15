//
//  NetworkDataFetcher.swift
//  NewsProject
//
//  Created by Zhanibek Santay on 6/12/20.
//  Copyright © 2020 Zhanibek Santay. All rights reserved.
//

import Foundation

protocol DataFetcher {
    func fetchGenericJSONData<T: Decodable>(urlString:String,response: @escaping (T?) -> Void)
}


class NetworkDataFetcher:DataFetcher {
    
    var networking: Networking!
    
    init(networking:Networking = NetworkService()) {
        self.networking = networking
    }


    func fetchGenericJSONData<T: Decodable>(urlString:String,response: @escaping (T?) -> Void){
        networking.request(urlString: urlString) { (data, error) in
            if let error = error {
                print("Error recived requesting data: \(error.localizedDescription)")
                response(nil)
            }
            let decoded = self.decodeJSON(type: T.self, from: data)
            response(decoded)
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T?{
        let decoder = JSONDecoder()
        guard let data = from else{ return nil}
        do {
            let object = try decoder.decode(type.self, from: data)
            return object
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
         
}

