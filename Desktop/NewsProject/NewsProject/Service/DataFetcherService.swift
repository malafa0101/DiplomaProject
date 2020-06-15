//
//  DataFetcherService.swift
//  NewsProject
//
//  Created by Zhanibek Santay on 6/12/20.
//  Copyright © 2020 Zhanibek Santay. All rights reserved.
//

import UIKit

class DataFetcherService{

    var dataFetcher:DataFetcher!

    init(dataFetcher:DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    func fetchTopheadlinesModel(completion: @escaping (NewsModel?)->Void){
        let urlString = "https://newsapi.org/v2/top-headlines?country=de&category=business&apiKey=7edbb897d42f473da4315d5bc9ea2bf0"
        dataFetcher.fetchGenericJSONData(urlString: urlString, response: completion)
    }
    
    func fetchEverythingModel(completion: @escaping (NewsModel?)->Void){
        let urlString = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=7edbb897d42f473da4315d5bc9ea2bf0"
        dataFetcher.fetchGenericJSONData(urlString: urlString, response: completion)
    }

}
