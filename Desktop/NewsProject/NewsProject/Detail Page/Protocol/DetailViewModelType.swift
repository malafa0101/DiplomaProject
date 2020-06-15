//
//  DetailViewModelType.swift
//  NewsProject
//
//  Created by Zhanibek Santay on 6/13/20.
//  Copyright © 2020 Zhanibek Santay. All rights reserved.
//

import Foundation
protocol DetailViewModelType {
    var author:String {get}
    var title:String {get}
    var description:String {get}
    var urlToImage:String {get}
    var url:String {get}
    var publishedAt:String {get}
    var content:String? {get}
}
