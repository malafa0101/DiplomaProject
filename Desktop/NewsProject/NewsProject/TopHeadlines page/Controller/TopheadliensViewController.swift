//
//  TopheadliensViewController.swift
//  NewsProject
//
//  Created by Zhanibek Santay on 6/12/20.
//  Copyright © 2020 Zhanibek Santay. All rights reserved.
//

import UIKit

class TopheadliensViewController: UIViewController {
    
    let topheadlinesViewModel = TopheadlinesViewModel()
    let identifier = "TopheadlinesNewsCell"
    let indicatorIdentifier = "TopheadlinesActivityIndicatorCell"
    var timer = Timer()
    var fatchingMore = false
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.register(TopheadlinesNewsCell.self, forCellReuseIdentifier: identifier)
        tableView.register(ActivityIndicatorCell.self, forCellReuseIdentifier: indicatorIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.968627451, blue: 0.9764705882, alpha: 1)
        scheduledTimerWithTimeInterval()
        title = "Top Headlines News"
        setupConst()
        fetchData()
    }
    
    func scheduledTimerWithTimeInterval(){
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(updateCounting), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounting(){
        topheadlinesViewModel.checkMethod { (bool) in
            print(bool)
            if bool{
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    private func addNews() {
        topheadlinesViewModel.addNews{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func beginBatchFatch() -> Void {
        fatchingMore = true
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100), execute: {
            self.addNews()
            self.fatchingMore = false
        })
        
    }
    
    private func setupConst() {
        self.view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    private func fetchData() {
        topheadlinesViewModel.getNews {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}

extension TopheadliensViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return topheadlinesViewModel.numberOfRowsInSection()
        }
        return 1
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TopheadlinesNewsCell
            cell.callShowAlert = {
                self.showAlert(title: "Thank you", message: "You successfully save news to the favourite")
            }
            let news = topheadlinesViewModel.cellForRowAt(forIndexPath: indexPath)
            cell.news = news
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: indicatorIdentifier, for: indexPath) as! ActivityIndicatorCell
            cell.isUserInteractionEnabled = false
            cell.backgroundColor = .clear
            cell.indicator.startAnimating()
            return cell
        }
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailViewController()
        vc.viewModel = topheadlinesViewModel.selectRowAt(forIndexPath: indexPath)
        self.show(vc, sender: self)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 140 : 40
    }
    
}

extension TopheadliensViewController:UIScrollViewDelegate {
    
            func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offsetY = scrollView.contentOffset.y
            let contentHeight = scrollView.contentSize.height
            if offsetY > contentHeight - scrollView.frame.height{
                if !fatchingMore {
                    beginBatchFatch()
                }
            }
    }
}

 
