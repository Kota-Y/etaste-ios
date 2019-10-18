//
//  finViewController.swift
//  ETASTE
//
//  Created by 中野柊人 on 2019/10/14.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import UIKit

class FinViewController: UIViewController{
    
    
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var toHomeLink: UILabel!
    
    //var store: Store!
    var isfavorite = true
    
    let storeModel = StoreModel()
    let storefavorite = StoreFavoriteModel()
    
    override func viewDidLoad() {
        self.navigationItem.title = "購入完了"

        //ホームへ遷移できるようにする
        let tapToHome: UITapGestureRecognizer = UITapGestureRecognizer( target: self, 
                                                                    action: #selector(FinViewController.toHomeButton(_ :)))
        self.toHomeLink.isUserInteractionEnabled = true
        self.toHomeLink.addGestureRecognizer(tapToHome)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Fin画面に戻って来たときにタブバーを消す
        self.tabBarController?.tabBar.isHidden = true

    }
    
    //お気に入りボタンのアクション
    //storeidは1で決め打ち
    @IBAction func favorite(_ sender: Any) {
        isfavorite.toggle()
        switchfavorite()
        isfavorite ? storefavorite.deleteFavorite(storeid: 1) : storefavorite.createFavorite()
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
