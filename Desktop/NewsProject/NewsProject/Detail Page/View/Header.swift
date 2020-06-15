//
//  Header.swift
//  NewsProject
//
//  Created by Zhanibek Santay on 6/13/20.
//  Copyright © 2020 Zhanibek Santay. All rights reserved.
//

import UIKit
class Header: UICollectionReusableView {
    let imageview: CashedImage = {
        let view = CashedImage()
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupConstraitns()
    }
    
    func setupConstraitns() {
        addSubview(imageview)
        imageview.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageview.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imageview.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        imageview.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
