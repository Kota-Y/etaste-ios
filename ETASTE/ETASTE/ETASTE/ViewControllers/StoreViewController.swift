//
//  StoreDetails.swift
//  ETASTE
//
//  Created by 石黒晴也 on 2019/08/24.
//

import Foundation
import UIKit
import GoogleMaps

class StoreViewController: UIViewController {
    
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var holidayLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!
    @IBOutlet weak var parkingLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var googleMap: GMSMapView!
    @IBOutlet weak var favoritebutton: UIButton!
    
    @IBOutlet var imagesNeedPlaceHolder: [UIImageView]!
    @IBOutlet var labelsNeedPlaceHolder: [UILabel]!
    
    var store: Store!
    var isfavorite = false
    
    let storeModel = StoreModel()
    let storefavorite = StoreFavoriteModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "店舗情報"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "loginicon")?.withRenderingMode(.alwaysOriginal),
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(login))
        imagesNeedPlaceHolder.appearImagePlaceHolders()
        labelsNeedPlaceHolder.appearLabelPlaceHolders()
        
        storeModel.delegate = self
        storeModel.getStore(storeId: 1) // 店舗のIDは決め打ち
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @objc func login() {
        
    }
    
    @IBAction func favoritebutton(_ sender: Any) {
        isfavorite = !isfavorite
        if isfavorite {
            storefavorite.createFavorite()
        } else {
            storefavorite.deleteFavorite(storeid: store._id)
        }
         switchfavorite()
    }
    
    func switchfavorite(){
        if isfavorite {
            let image = UIImage(named: "fav2")
            favoritebutton.setBackgroundImage(image, for: .normal)
        } else {
            let image = UIImage(named: "fav1")
            favoritebutton.setBackgroundImage(image, for: .normal)
        }
    }
    
}

extension StoreViewController: StoreModelDelegate {
    func didRecieveStoreData(storeModel: StoreModel, store: Store) {
        storeImage.image = UIImage(url: store.image)
        storeNameLabel.text = store.name
        timeLabel.text = store.openTime + "〜" + store.closeTime
        holidayLabel.text = store.holiday
        addressLabel.text = store.zip + "\n" + store.address
        telLabel.text = store.tel
        parkingLabel.text = store.parking
        let attributeURLText = NSMutableAttributedString(string: store.url)
        attributeURLText.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, store.url.count))
        urlLabel.attributedText = attributeURLText
        
        let mapPosition = CLLocationCoordinate2D(latitude: Double(store.mapLatitude) as! CLLocationDegrees, longitude: Double(store.mapLongitude) as! CLLocationDegrees)
        let camera = GMSCameraPosition.camera(withTarget: mapPosition, zoom: 15)
        googleMap.camera = camera
        let marker = GMSMarker()
        marker.position = mapPosition
        marker.map = googleMap
        
    }
    
    func didRecieveStoreError(storeModel: StoreModel, error: Error) {
        print("Error on getStore")
    }
    
}

extension StoreViewController:StoreFavoriteModelDelegate {
    func didReceiveStoreFavoriteModel(storeFavoritemodel: StoreFavoriteModel, Favorite: Favorite) {
        let fav = Favorite.favoriteStores
        for i in 0..<fav.count {
            if fav[i]._id == store._id {
                self.isfavorite = true
                self.switchfavorite()
            }
        }
    }
    
    
    func didRecieveStoreFavoriteError(storeFavoritemodel:StoreFavoriteModel, error: Error){
        print("Error on getFood :", error)
    }
}


