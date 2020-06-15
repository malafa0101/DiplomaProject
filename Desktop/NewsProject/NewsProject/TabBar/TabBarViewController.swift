//
//  TabBarViewController.swift
//  NewsProject
//
//  Created by Zhanibek Santay on 6/12/20.
//  Copyright © 2020 Zhanibek Santay. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
//    MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupNav()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    //MARK: - setupviews
    func setupViews() -> Void {
        let topHeadlinesController = TopheadliensViewController().inNavigation()
        topHeadlinesController.tabBarItem = UITabBarItem.init(title: "Top headliens", image: #imageLiteral(resourceName: "search"), tag: 0)
        let everythingController = EverythingViewController().inNavigation()
        everythingController.tabBarItem = UITabBarItem.init(title: "Everything", image: #imageLiteral(resourceName: "search"), tag: 1)
        let favouriteController = FavouriteViewController().inNavigation()
        favouriteController.tabBarItem = UITabBarItem.init(title: "Favourite", image: #imageLiteral(resourceName: "search"), tag: 1)
        viewControllers = [topHeadlinesController,everythingController,favouriteController]
    }
    
    func setupNav() -> Void {
        self.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.384, green: 0.384, blue: 0.384, alpha: 1)
        self.tabBar.backgroundColor = .white
        self.tabBar.barTintColor = .white
    }
 

}

