//
//  FavouriteViewController.swift
//  NewsProject
//
//  Created by Zhanibek Santay on 6/14/20.
//  Copyright © 2020 Zhanibek Santay. All rights reserved.
//

import UIKit

class FavouriteViewController: UIViewController {
    let viewModel = FavouriteViewModel()
    let identifier = "EveryThingNewsCell"
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.register(TopheadlinesNewsCell.self, forCellReuseIdentifier: identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.refreshControl = refresher
        return tableView
    }()
    lazy var refresher : UIRefreshControl = {
        let refreshe_Control = UIRefreshControl()
        refreshe_Control.addTarget(self, action:#selector(ResourcesData), for: .valueChanged)
        return refreshe_Control
    }()
    
    var fatchingMore = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.968627451, blue: 0.9764705882, alpha: 1)
        title = "Favourite"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(addTapped))
        setupConst()
    }
    
    @objc func ResourcesData() {
        getData()
        let deadline = DispatchTime.now() + .milliseconds(100)
        DispatchQueue.main.asyncAfter(deadline: deadline){
            self.refresher.endRefreshing()
        }
    }
    
    @objc func addTapped(){
        viewModel.deleteAllRecords()
        self.tableView.reloadData()
    }
    
    private func getData() {
        viewModel.fetchDataFromCoreData()
        self.tableView.reloadData()
    }
    
    private func setupConst() {
        self.view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}

extension FavouriteViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TopheadlinesNewsCell
        cell.favouriteButton.isHidden = true
        let news = viewModel.cellForRowAt(forIndexPath: indexPath)
        cell.news = news
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailViewController()
        vc.viewModel = viewModel.selectRowAt(forIndexPath: indexPath)
        self.show(vc, sender: self)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}


