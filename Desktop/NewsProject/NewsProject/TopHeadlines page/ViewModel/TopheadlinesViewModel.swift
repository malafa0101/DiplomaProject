//
//  TopheadlinesViewController.swift
//  NewsProject
//
//  Created by Zhanibek Santay on 6/13/20.
//  Copyright © 2020 Zhanibek Santay. All rights reserved.
//

import Foundation
class TopheadlinesViewModel {
    var news: [Article]?
    var dataFetcherService = DataFetcherService()
    var totalResults = 0
    
    func getNews(completion: @escaping () -> ()) {
        dataFetcherService.fetchTopheadlinesModel { [weak self] (results) in
            self?.news = results?.articles
            guard let totalresults = results?.totalResults else {return}
            self!.totalResults = totalresults
            completion()
        }
    }
    
    func addNews(completion: @escaping () -> ()) {
         dataFetcherService.fetchTopheadlinesModel(completion: { [weak self] (results) in
            guard let totalresults = results?.totalResults,let results = results else {return}
            self?.news! += results.articles!
            self!.totalResults = totalresults
            completion()
        })
    }
    
    func checkMethod(completion: @escaping (Bool) -> ()){
        dataFetcherService.fetchTopheadlinesModel { [weak self] (results) in
            guard let totalresults = results?.totalResults else {return}
            if  totalresults != self!.totalResults{
                self?.news = results?.articles
                self!.totalResults = results!.totalResults!
                completion(true)
                return
        }
            completion(false)
        }
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

