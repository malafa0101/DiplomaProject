//
//  Extension.swift
//  NewsProject
//
//  Created by Zhanibek Santay on 6/12/20.
//  Copyright © 2020 Zhanibek Santay. All rights reserved.
//

import UIKit


extension UIViewController {
    
    static let navBarHeight = UINavigationController().navigationBar.bounds.height

    func inNavigation() -> UIViewController {
        return UINavigationController(rootViewController: self)
    }
    
    func getStatusBarFrame() -> CGRect {
        var statusBarFrame: CGRect
        
        if #available(iOS 13.0, *) {
            statusBarFrame = .zero
        } else {
            statusBarFrame = UIApplication.shared.statusBarFrame
        }
        
        return statusBarFrame
    }
    
    func showAlert(title: String, message: String) -> Void {
          let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
           let yesAction = UIAlertAction(title: "Ок", style: .cancel)
            alert.addAction(yesAction)
          self.present(alert, animated: true, completion: nil)
          
    }
    
}


