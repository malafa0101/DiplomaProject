//
//  NotificationModel.swift
//  DiplomProject
//
//  Created by Zhanibek Santay on 5/28/20.
//  Copyright © 2020 Zhanibek Santay. All rights reserved.
//

import Foundation
class Notification: Codable {
    var data: [NotificationModel]
}
class NotificationModel: Codable {
    var title: String
    var data: String
    var hour: String
    var image: String
}
