//
//  FavoriteViewController.swift
//  ETASTE
//
//  Created by 石黒晴也 on 2019/08/10.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation
import UIKit

class FavoriteViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "お気に入り"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "loginicon")?.withRenderingMode(.alwaysOriginal),
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(login))
    }
    
    @objc func login() {
        
    }
}
