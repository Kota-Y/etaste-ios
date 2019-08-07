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
    
    var shopModel: ShopModel = ShopModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "ホーム"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "loginicon")?.withRenderingMode(.alwaysOriginal),
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(login))
                
        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let zoom: Float = 15
        let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: shopModel.latitude,longitude: shopModel.longitude, zoom: zoom)
        googleMap.camera = camera
        
        let marker: GMSMarker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(shopModel.latitude, shopModel.longitude)
        marker.map = googleMap
    }
    
    @objc func login() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension HomeViewController: UISearchBarDelegate {
    
}
