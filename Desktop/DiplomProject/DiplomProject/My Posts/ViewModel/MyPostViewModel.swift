//
//  MyPostViewModel.swift
//  DiplomProject
//
//  Created by Zhanibek Santay on 5/28/20.
//  Copyright © 2020 Zhanibek Santay. All rights reserved.
//

import Foundation
class MyPostViewModel {
    var delegate: ProcessViewDelegate?
    var myPostList: [ItemModel] = []
    
    func getMyPosts() -> Void {
        ParseManager.shared.getRequest(url: AppConstants.API.getMyBootcamps, success: { (result: ItemListModel) in
            self.myPostList = result.data
            self.delegate?.endRefreshing()
            self.delegate?.hideLoader()
            self.delegate?.updateUI()
        }) { (error) in
            self.delegate?.endRefreshing()
            self.delegate?.hideLoader()
            self.delegate?.showErrorMessage(error)
        }
    }

}
