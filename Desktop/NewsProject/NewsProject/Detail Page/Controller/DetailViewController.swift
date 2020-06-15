//
//  DetailViewController.swift
//  NewsProject
//
//  Created by Zhanibek Santay on 6/13/20.
//  Copyright © 2020 Zhanibek Santay. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    let identifier = "Detail"
    let headerIdentifier = "HeaderCell"
    lazy var collectionView:UICollectionView = {
        let layout = StretchyHeaderLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        collectionView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    var viewModel: DetailViewModelType?
    var navBarView = NavBarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.collectionView.contentInset = UIEdgeInsets(top: -30, left: 0, bottom: 0, right: 0)
        self.view.backgroundColor = .white
        setupConst()
        setupAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func setupConst() {
        self.view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        self.view.addSubview(navBarView)
        navBarView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        navBarView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        navBarView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        navBarView.heightAnchor.constraint(equalToConstant: UIApplication.shared.statusBarFrame.height + UINavigationController().navigationBar.bounds.height).isActive = true
    }

    private func setupAction(){
        navBarView.backTarget = {
            self.navigationController?.popViewController(animated: true)
            
        }
    }
}
extension DetailViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! DetailCollectionViewCell
        cell.viewModel = viewModel
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height * 0.7)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! Header
        header.imageview.set(imageUrl: viewModel!.urlToImage)
        return header
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: UIScreen.main.bounds.height * 0.3)
    }
}

