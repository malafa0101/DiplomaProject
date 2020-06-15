//
//  EverythingViewModel.swift
//  NewsProject
//
//  Created by Zhanibek Santay on 6/13/20.
//  Copyright © 2020 Zhanibek Santay. All rights reserved.
//

import Foundation

class EverythingViewModel{
    var news: [Article]?
    var dataFetcherService = DataFetcherService()
    
    func getNews(completion: @escaping () -> ()) {
        
        dataFetcherService.fetchEverythingModel { [weak self] (results) in
               self?.news = results?.articles
                     completion()
        }
    }
    
    func addNews(completion: @escaping () -> ()) {
         dataFetcherService.fetchTopheadlinesModel(completion: { [weak self] (results) in
            guard let results = results else {return}
            self?.news! += results.articles!
            completion()
        })
    }
    
    func numberOfRowsInSection() -> Int {
        return self.news?.count ?? 0
    }
    
    func cellForRowAt(forIndexPath indexpath:IndexPath) -> Article? {
        guard let news = news else {return nil}
        return news[indexpath.row]
    }
    func selectRowAt(forIndexPath indexpath:IndexPath) -> DetailViewModelType? {
        guard let news = news else {return nil}
        return DetailViewModel(news: news[indexpath.row])
    }
    
}
