//
//  StoreDetails.swift
//  ETASTE
//
//  Created by 石黒晴也 on 2019/08/24.
//

import Foundation
import UIKit
import GoogleMaps

class StoreDetailsViewController: UIViewController {
    
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var holiday: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var googleMap: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "店舗詳細"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "loginicon")?.withRenderingMode(.alwaysOriginal),
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(login))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 要素は決め打ち
        let storeDetailModel = StoreDetailModel(id: 1, name: "Eパン（熊本本店）", image: URL(string: "https://dl.dropboxusercontent.com/s/7vyyl6u3h66enwv/takigawa-pan.jpg")!, openTime: "08:00", closeTime: "21:00", zip: "〒000-0000", address: "熊本県熊本市00区00町0-00\nKUMADAIビル1F", tel: "", holiday: "不定休（店休）", parking: "", access: "", map: CLLocationCoordinate2DMake(32.815183,130.727428), url: URL(string: "http://takigawapan.jp/")!)
        
        storeName.text = storeDetailModel.name
        time.text = storeDetailModel.openTime + "〜" + storeDetailModel.closeTime
        holiday.text = storeDetailModel.holiday
        address.text = storeDetailModel.zip + "\n" + storeDetailModel.address
        
        let camera = GMSCameraPosition.camera(withTarget: storeDetailModel.map, zoom: 15)
        googleMap.camera = camera
        let marker = GMSMarker()
        marker.position = storeDetailModel.map
        marker.map = googleMap
    }
    
    @objc func login() {
        
    }
    
}
