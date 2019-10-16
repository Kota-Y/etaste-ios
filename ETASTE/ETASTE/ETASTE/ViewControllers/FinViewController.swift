//
//  finViewController.swift
//  ETASTE
//
//  Created by 中野柊人 on 2019/10/14.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import UIKit
import Alamofire

class FinViewController: UIViewController{
    
    
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var toHomeLink: UILabel!
    
    var store: Store!
    var isfavorite = false
    
    let storeModel = StoreModel()
    let storefavorite = StoreFavoriteModel()
    
    override func viewDidLoad() {
        self.navigationItem.title = "購入完了"

        //ホームへ遷移できるようにする
        let tapToHome: UITapGestureRecognizer = UITapGestureRecognizer( target: self, 
                                                                    action: #selector(FinViewController.toHomeButton(_ :)))
        self.toHomeLink.isUserInteractionEnabled = true
        self.toHomeLink.addGestureRecognizer(tapToHome)
        
        //タブバーを非表示にする
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Fin画面に戻って来たときにタブバーを消す
        self.tabBarController?.tabBar.isHidden = true

    }
    
    //お気に入りボタンのアクション
    @IBAction func favorite(_ sender: Any) {
        isfavorite = !isfavorite
        if isfavorite {
            storefavorite.createFavorite()
        } else {
            storefavorite.deleteFavorite(storeid: store._id)
        }
        switchfavorite()
    }
    
    
    //お気に入りボタンの切り替え
    func switchfavorite(){
        if isfavorite {
            let image = UIImage(named: "fav1")
            favoriteButton.setBackgroundImage(image, for: .normal)
        } else {
            let image = UIImage(named: "fav2")
            favoriteButton.setBackgroundImage(image, for: .normal)
        }
    }
    
    //「完了」ボタンからdeal画面へ
    @IBAction func toDealViewButton(_ sender: Any) {

        let mainTabBarControllerStoryboard = UIStoryboard(name: "MainTabBarController", bundle: nil)
        let mainTabBarController = mainTabBarControllerStoryboard.instantiateInitialViewController() as! MainTabBarController
        present(mainTabBarController, animated: false, completion: nil)
        mainTabBarController.selectedViewController = mainTabBarController.viewControllers![2]
        
    }
    
    
    //「ホームへ」ラベルからHome画面へ
    @objc func toHomeButton(_ sender: UITapGestureRecognizer){

        let mainTabBarControllerStoryboard = UIStoryboard(name: "MainTabBarController", bundle: nil)
        let mainTabBarController = mainTabBarControllerStoryboard.instantiateInitialViewController() as! MainTabBarController
        present(mainTabBarController, animated: false, completion: nil)
        mainTabBarController.selectedViewController = mainTabBarController.viewControllers![0]

    }
    
    
}
