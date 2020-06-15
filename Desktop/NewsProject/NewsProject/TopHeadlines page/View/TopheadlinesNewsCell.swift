//
//  NewsCell.swift
//  NewsProject
//
//  Created by Zhanibek Santay on 6/13/20.
//  Copyright © 2020 Zhanibek Santay. All rights reserved.
//

import UIKit

class TopheadlinesNewsCell: UITableViewCell {
    
    var database = CoreDataDatabase()
    var favouriteBool = false
    var callShowAlert: (() -> ())?
    let titleLabel:UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    let descriptionLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    let imageview: CashedImage = {
       let imageView = CashedImage()
       imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    let views:UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let Inview:UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let favouriteButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "yelStars"), for: .normal)
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        button.backgroundColor = #colorLiteral(red: 0.2, green: 0.2470588235, blue: 0.3215686275, alpha: 0.25)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var news:Article? {
        didSet {
            guard let news = news else {return}
            titleLabel.text = news.author
            descriptionLabel.text = news.description
            imageview.set(imageUrl:news.urlToImage ?? "nothing")
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupLayout()
        // Configure the view for the selected state
    }
    @objc func saveToFavourite(){
        database.saveTask(news: news!)
        callShowAlert?()
    }
    
    func setupLayout() {
        favouriteButton.addTarget(self, action: #selector(saveToFavourite), for: .touchUpInside)
        Inview.layer.cornerRadius = 16
        Inview.layer.shadowColor = UIColor.black.cgColor
        Inview.layer.shadowRadius = 5
        Inview.layer.shadowOpacity = 0.1
        Inview.layer.shadowOffset = CGSize(width: 0, height: 0)
        backgroundColor = .clear
        addSubview(Inview)
        Inview.addSubview(views)
        views.addSubview(titleLabel)
        views.addSubview(descriptionLabel)
        views.addSubview(imageview)
        imageview.addSubview(favouriteButton)
        
        Inview.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        Inview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        Inview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        Inview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        
        views.topAnchor.constraint(equalTo: Inview.topAnchor, constant: 8).isActive = true
        views.leadingAnchor.constraint(equalTo: Inview.leadingAnchor, constant: 8).isActive = true
        views.trailingAnchor.constraint(equalTo: Inview.trailingAnchor, constant: -8).isActive = true
        views.bottomAnchor.constraint(equalTo: Inview.bottomAnchor, constant: -8).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: views.topAnchor,constant: 8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: views.leadingAnchor,constant: 4).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 8).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: imageview.leadingAnchor, constant: -8).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: views.bottomAnchor, constant: -8).isActive = true
      
      
        imageview.topAnchor.constraint(equalTo: views.topAnchor,constant: 8).isActive = true
        imageview.trailingAnchor.constraint(equalTo: views.trailingAnchor,constant: -4).isActive = true
        imageview.bottomAnchor.constraint(equalTo: views.bottomAnchor,constant: -8).isActive = true
        imageview.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        favouriteButton.topAnchor.constraint(equalTo: imageview.topAnchor, constant: 10).isActive = true
        favouriteButton.leadingAnchor.constraint(equalTo: imageview.leadingAnchor, constant: 10).isActive = true
        favouriteButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        favouriteButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }

}

