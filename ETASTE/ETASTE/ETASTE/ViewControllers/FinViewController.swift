//
//  finViewController.swift
//  ETASTE
//
//  Created by 中野柊人 on 2019/10/14.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import UIKit

class FinViewController: UIViewController{
    
    override func viewDidLoad() {
        self.navigationItem.title = "購入完了"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "loginicon")?.withRenderingMode(.alwaysOriginal),
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(login))
    }

    @objc func login() {
        
    }
    
}
