//
//  HomeViewContrie¥.swift
//  ETASTE
//
//  Created by hakuchan on 2019/07/29.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class HomeViewController: UIViewController {
    
    @IBOutlet weak var googleMap: GMSMapView!
    @IBOutlet weak var searchBar: UISearchBar!

    @IBOutlet var itemTableView: UITableView!
    
    var shopModel:[ShopModel] = []
    var marker: [GMSMarker] = []
    var lalo:[[Double]] = [[32.815183,130.727428],[32.814949,130.727842],[32.814419,130.726572]]
    
    // TODO: 商品画面への遷移かどうか使うフラグ。いつか消すように
    var isToItemViewFlag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "ホーム"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "loginicon")?.withRenderingMode(.alwaysOriginal),
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(login))
                
        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        //shopmodel
        for i in 0..<lalo.count{
            let appendModel = ShopModel(latitude: lalo[i][0],longitude: lalo[i][1])
            shopModel.append(appendModel)
        }
        //googlemap表示
        let zoom: Float = 15
        let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: shopModel[0].latitude!,longitude: shopModel[0].longitude!, zoom: zoom)
        googleMap.camera = camera

        //マーカー表示
        for i in 0..<lalo.count{
            let mark: GMSMarker = GMSMarker()
            mark.position = CLLocationCoordinate2DMake(shopModel[i].latitude!, shopModel[i].longitude!)
            mark.map=googleMap
            marker.append(mark)
        }
        
        //Fin画面から戻ってきたときにタブバーが消えないようにする
        self.tabBarController?.tabBar.isHidden = false

    }
    
    @objc func login() {
        
    }
    
    // 画面遷移のテスト用
    @IBAction func tapTestButton(_ sender: UIButton) {
        let storeViewControllerStoryboard = UIStoryboard(name: "StoreViewController", bundle: nil)
        let storeViewController = storeViewControllerStoryboard.instantiateInitialViewController() as! StoreViewController
        self.navigationController?.pushViewController(storeViewController, animated: true)
    }
    // 商品購入画面への遷移用
    @IBAction func tapToItemViewButton(_ sender: UIButton) {
        let itemViewControllerStoryboard = UIStoryboard(name: "ItemViewController", bundle: nil)
        let itemViewController = itemViewControllerStoryboard.instantiateInitialViewController() as! ItemViewController
        self.navigationController?.pushViewController(itemViewController, animated: true)

    }
    @IBAction func tapToNoItemViewButton(_ sender: UIButton) {
        
    }
    
    //購入完了画面への遷移テスト用
    @IBAction func tapToFinViewButton(_ sender: UIButton) {
        let finViewControllerStoryboard = UIStoryboard(name: "FinViewController", bundle: nil)
        let finViewController = finViewControllerStoryboard.instantiateInitialViewController() as! FinViewController
        self.navigationController?.pushViewController(finViewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension HomeViewController: UISearchBarDelegate {
}


