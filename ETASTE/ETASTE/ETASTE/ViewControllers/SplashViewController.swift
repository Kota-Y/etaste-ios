//
//  SplashViewController.swift
//  ETASTE
//
//  Created by hakuchan on 2019/07/29.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation
import UIKit

class SplashViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("self.view.safeAreaInsets.top)", self.view.safeAreaInsets.top)
        
        let mainTabBarControllerStoryboard = UIStoryboard(name: "MainTabBarController", bundle: nil)
        let mainTabBarController = mainTabBarControllerStoryboard.instantiateInitialViewController() as! MainTabBarController
        present(mainTabBarController, animated: false, completion: nil)
    }
    
}


