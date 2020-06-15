//
//  TopheadLinesModel.swift
//  NewsProject
//
//  Created by Zhanibek Santay on 6/13/20.
//  Copyright © 2020 Zhanibek Santay. All rights reserved.
//

import Foundation

struct NewsModel:Decodable{
    var totalResults:Int?
    var articles:[Article]?
}
struct Article:Decodable {
    var author:String?
    var title:String?
    var description:String?
    var urlToImage:String?
    var url:String?
    var publishedAt:String?
    var content:String?
}
