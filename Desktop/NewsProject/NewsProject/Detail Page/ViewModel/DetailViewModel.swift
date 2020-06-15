//
//  DetailViewModel.swift
//  NewsProject
//
//  Created by Zhanibek Santay on 6/13/20.
//  Copyright © 2020 Zhanibek Santay. All rights reserved.
//

import Foundation
class DetailViewModel:DetailViewModelType {
    var news:Article!
    init(news:Article) {
        self.news = news
    }
    var author: String {
        return news.author ?? "nothing"
    }
    
    var title: String {
        return news.title ?? "nothing"
    }
    
    var description: String {
        return news.description ?? "nothing"
    }
    
    var urlToImage: String {
        return news.urlToImage ?? "nothing"
    }
    
    var url: String {
        return news.url ?? "nothing"
    }
    
    var publishedAt: String {
        return news.publishedAt ?? "nothing"
    }
    
    var content: String? {
        return news.content ?? "nothing"
    }
    
    
}
