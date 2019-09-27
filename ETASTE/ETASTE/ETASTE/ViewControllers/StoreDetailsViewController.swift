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
    
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var holidayLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!
    @IBOutlet weak var parkingLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    @IBOutlet weak var googleMap: GMSMapView!

    @IBOutlet weak var favbutton: UIButton!
    
  
   
    var isfavorite:Bool!
    let storefavorite = StoreFavoriteModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "店舗詳細"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "loginicon")?.withRenderingMode(.alwaysOriginal),
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(login))
        isfavorite = false
        storefavorite.delegate = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 要素は決め打ち
        let storeDetailModel = StoreDetailModel(id: 1, name: "Eパン（熊本本店）", image: URL(string: "https://dl.dropboxusercontent.com/s/7vyyl6u3h66enwv/takigawa-pan.jpg")!, openTime: "08:00", closeTime: "21:00", zip: "〒000-0000", address: "熊本県熊本市00区00町0-00\nKUMADAIビル1F", tel: "000-0000-0000", holiday: "不定休（店休）", parking: "駐車場　徒歩5分にあり(有料)", access: "", map: CLLocationCoordinate2DMake(32.815183,130.727428), url: URL(string: "http://takigawapan.jp/")!)
        
        storeNameLabel.text = storeDetailModel.name
        timeLabel.text = storeDetailModel.openTime + "〜" + storeDetailModel.closeTime
        holidayLabel.text = storeDetailModel.holiday
        addressLabel.text = storeDetailModel.zip + "\n" + storeDetailModel.address
        telLabel.text = storeDetailModel.tel
        parkingLabel.text = storeDetailModel.parking
        let urlText = storeDetailModel.url.absoluteString
        let attributeURLText = NSMutableAttributedString(string: urlText)
        attributeURLText.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, urlText.count))
        urlLabel.attributedText = attributeURLText
        
        let camera = GMSCameraPosition.camera(withTarget: storeDetailModel.map, zoom: 15)
        googleMap.camera = camera
        let marker = GMSMarker()
        marker.position = storeDetailModel.map
        marker.map = googleMap
        
        let userid:Int64 = 1
        storefavorite.set(userid: Int64(userid), storeid: Int64(storeDetailModel.id), storename: storeDetailModel.name)
        storefavorite.getisFavorite()
       
    }
    
    
    
    func switchfavorite(){
        if storefavorite.isfavorite {
            let image = UIImage(named: "fav2")
            favbutton.setBackgroundImage(image, for: .normal)
        } else {
            let image = UIImage(named: "fav1")
            favbutton.setBackgroundImage(image, for: .normal)
        }
    }
    
    @IBAction func favoritebutton(_ sender: Any) {
        storefavorite.isfavorite = !storefavorite.isfavorite
        switchfavorite()
        if  storefavorite.isfavorite {
            storefavorite.createFavorite()
        } else {
            storefavorite.deleteFavorite()
        }
    }

    
    @objc func login() {
        
    }
    
}

extension StoreDetailsViewController:StoreFavoriteModelDelegate {
    func didReceiveStoreFavoriteModel(storeFavoritemodel: StoreFavoriteModel, Favorite: Favorite) {
        let fav = Favorite.favoriteStores
            for i in 0..<fav.count {
                if fav[i]._id == storefavorite.storeid {
                    self.isfavorite = true
                    storefavorite.isfavorite = true
                    self.switchfavorite()
                }
            }
    }
    func didRecieveStoreFavoriteError(storeFavoritemodel:StoreFavoriteModel, error: Error){
         print("Error on getFood :", error)
    }
}
