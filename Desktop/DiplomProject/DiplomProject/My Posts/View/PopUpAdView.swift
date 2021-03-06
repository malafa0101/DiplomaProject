//
//  PopUpAdView.swift
//  DiplomProject
//
//  Created by Zhanibek Santay on 4/19/20.
//  Copyright © 2020 Zhanibek Santay. All rights reserved.
//

import UIKit

class PopUpAdView: NSObject, UITableViewDataSource, UITableViewDelegate {

    let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .white
        tv.separatorStyle = .none
        tv.layer.masksToBounds = true
        tv.layer.cornerRadius = 10
        return tv
    }()
    
    var array = ["Редактировать","Удалить объявление"]
    
    let blackView = UIView()
    
    override init() {
        super.init()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.cellIdentifier())
        
    }

    func showSettings(index:Int){
        if let window = UIApplication.shared.keyWindow{
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.3)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            window.addSubview(blackView)
            window.addSubview(tableView)
            let height = window.frame.height * 0.62
            tableView.frame = CGRect(x: Int(Float(window.frame.width) - 250), y: index * 60 + 130, width: 188, height: 92)
            blackView.frame = window.frame
            blackView.alpha = 1
        }
    }
    
    @objc func handleDismiss(){
        dismissFunc()
    }
    
    func dismissFunc(){
        self.blackView.alpha = 0
        if let window = UIApplication.shared.keyWindow {
            self.tableView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width-32, height: self.tableView.frame.height)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.cellIdentifier(), for: indexPath)
        cell.textLabel?.text = array[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = .getProximaNovaMediumFont(on: 16)
        cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row,": index")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

