//
//  MainTabBarController.swift
//  ETASTE
//
//  Created by 石黒晴也 on 2019/08/10.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation
import UIKit

enum ViewControllerOnTab: CaseIterable {
    case home
    case favorite
    case deal
    case setting
    
    var viewController: UIViewController {
        switch self{
        case .home:
            return HomeViewController()
        case .favorite:
            return FavoriteViewController()
        case .deal:
            return DealViewController()
        case .setting:
            return SettingViewController()
        }
    }
    
    var viewControllerName: String {
        switch self{
        case .home:
            return "HomeViewController"
        case .favorite:
            return "FavoriteViewController"
        case .deal:
            return "DealViewController"
        case .setting:
            return "SettingViewController"
        }
    }
    
    var itemImageName: String {
        switch self{
        case .home:
            return "HomeIcon"
        case .favorite:
            return "FavoriteIcon"
        case .deal:
            return "DealIcon"
        case .setting:
            return "SettingIcon"
        }
    }
}

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = UIColor.etasteDarkerYellow
        tabBar.unselectedItemTintColor = UIColor.etasteGray
        tabBar.barTintColor = UIColor.paleWhite
        
        var viewControllers = [UIViewController]()
        let imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        for viewControllerOnTab in ViewControllerOnTab.allCases {
            
            let viewController = UIStoryboard(name: viewControllerOnTab.viewControllerName, bundle: nil).instantiateInitialViewController()
            viewController?.tabBarItem = UITabBarItem(title: "",
                                                      image:  UIImage(named: viewControllerOnTab.itemImageName),
                                                      selectedImage:  UIImage(named: viewControllerOnTab.itemImageName))
            viewController?.tabBarItem.imageInsets = imageInsets
            let navigationController = UINavigationController(rootViewController: viewController!)
            viewControllers.append(navigationController)
        }
                
        self.setViewControllers(viewControllers, animated: false)
        
    }
    
}
