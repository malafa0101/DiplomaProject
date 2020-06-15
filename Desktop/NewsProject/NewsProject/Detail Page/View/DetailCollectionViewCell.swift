//
//  DetailCollectionViewCell.swift
//  NewsProject
//
//  Created by Zhanibek Santay on 6/13/20.
//  Copyright © 2020 Zhanibek Santay. All rights reserved.
//


import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    let authorLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 19)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    let descriptionLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    let contentLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    let urlLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let publishLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let calendarImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "search")
        return imageView
    }()
    private let moreInfo:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .lightGray
        label.text = "More Info:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var viewModel:DetailViewModelType? {
        didSet {
            guard let viewModel = viewModel,let contentText = viewModel.content else {return}
            let time = viewModel.publishedAt.split(separator: "T")
            let content = contentText.split(separator: "[")
            authorLabel.text = viewModel.author
            descriptionLabel.text = viewModel.description
            publishLabel.text = String(time[0])
            titleLabel.text = viewModel.title
            contentLabel.text = String(content[0])
            urlLabel.text = viewModel.url
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupConst()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupConst() {
        addSubview(authorLabel)
        addSubview(descriptionLabel)
        addSubview(titleLabel)
        addSubview(publishLabel)
        addSubview(contentLabel)
        addSubview(calendarImage)
        addSubview(moreInfo)
        addSubview(urlLabel)
        
        authorLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 16).isActive = true
        authorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor,constant: 8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
        publishLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 16).isActive = true
        publishLabel.leadingAnchor.constraint(equalTo: calendarImage.trailingAnchor,constant: 8).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: publishLabel.bottomAnchor,constant: 8).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
        calendarImage.centerYAnchor.constraint(equalTo: publishLabel.centerYAnchor).isActive = true
        calendarImage.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16).isActive = true
        calendarImage.widthAnchor.constraint(equalToConstant: 24).isActive = true
        calendarImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        contentLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,constant: 2).isActive = true
        contentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16).isActive = true
        contentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
        moreInfo.topAnchor.constraint(equalTo: contentLabel.bottomAnchor,constant: 16).isActive = true
        moreInfo.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16).isActive = true
        
        urlLabel.topAnchor.constraint(equalTo: contentLabel.bottomAnchor,constant: 16).isActive = true
        urlLabel.leadingAnchor.constraint(equalTo: moreInfo.trailingAnchor,constant: 8).isActive = true
        urlLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true

    }
}
