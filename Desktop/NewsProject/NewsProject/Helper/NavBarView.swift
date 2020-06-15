//
//  NavBarView.swift
//  NewsProject
//
//  Created by Zhanibek Santay on 6/13/20.
//  Copyright © 2020 Zhanibek Santay. All rights reserved.
//

import UIKit


class NavBarView: UIView {
    //MARK: - Properties
    var backTarget: (() -> ())?
    var saveTarget: (() -> ())?
    var shareTarget: (() -> ())?
    lazy var backIcon: UIButton = {
        let icon = UIButton()
        icon.setImage(#imageLiteral(resourceName: "🔹 Icon Color-2"), for: .normal)
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    lazy var bottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.48, green: 0.69, blue: 0.86, alpha: 0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //    MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = true
        setupView()
        setupGesture()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - Setup functions
    private func setupView() -> Void {
        bottomLine.alpha = 0
        addSubview(backIcon)
        
        backIcon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(UIViewController.navBarHeight/2 - 15)).isActive = true
        backIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        backIcon.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        addSubview(bottomLine)
        
        bottomLine.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bottomLine.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bottomLine.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        bottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    private func setupGesture() -> Void {
        let backGesture = UITapGestureRecognizer(target: self, action: #selector(backAction))
        backIcon.addGestureRecognizer(backGesture)
    }
    
    //    MARK: - Objc function
    
    @objc func backAction() -> Void {
        backTarget?()
    }
    
    
}
