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
        
        let homeViewControllerStoryboard = UIStoryboard(name: "HomeViewController", bundle: nil)
        let homeViewController = homeViewControllerStoryboard.instantiateInitialViewController() as! HomeViewController
        let navigationController = UINavigationController(rootViewController: homeViewController)
        present(navigationController, animated: false, completion: nil)
    }
    
}


