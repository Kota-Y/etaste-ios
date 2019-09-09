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
    
    // 動作確認で何かしら表示する用
    @IBOutlet weak var testLabel1: UILabel!
    @IBOutlet weak var testLabel2: UILabel!
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
    
    @IBAction func tapButton1(_ sender: UIButton) {
       
        let shopModel = ShopModel(latitude: 0, longitude: 0)
        shopModel.getStore(label: testLabel1)
    }
    @IBAction func tapButton2(_ sender: UIButton) {
        let favoriteModel = FavoriteModel()
        favoriteModel.createFavorite(label: testLabel2)
    }
    
}
