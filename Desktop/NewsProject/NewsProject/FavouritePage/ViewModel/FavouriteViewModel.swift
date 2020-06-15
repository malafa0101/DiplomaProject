//
//  FavouriteViewModel.swift
//  NewsProject
//
//  Created by Zhanibek Santay on 6/14/20.
//  Copyright © 2020 Zhanibek Santay. All rights reserved.
//

import UIKit

class FavouriteViewModel{
    var news: [Article]?
    var dataFetcherService = DataFetcherService()
    var database = CoreDataDatabase()
    
    
    func fetchDataFromCoreData(){
        database.fetchRequestData { (result) in
            self.news = result
        }
    }
    
    func deleteAllRecords(){
        database.deleteAllRecords()
        news = []
        print("deleted")
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
