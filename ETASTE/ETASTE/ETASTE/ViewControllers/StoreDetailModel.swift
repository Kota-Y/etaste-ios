//
//  StoreDetailModel.swift
//  ETASTE
//
//  Created by 石黒晴也 on 2019/08/24.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation
import GoogleMaps

class StoreDetailModel {
    let id: Int
    let name: String
    let image: URL
    let openTime: String
    let closeTime: String
    let zip: String
    let address: String
    let tel: String
    let holiday: String
    let parking: String
    let access: String
    let map: CLLocationCoordinate2D
    let url: URL
    
    init(id: Int, name: String, image: URL, openTime: String, closeTime: String, zip: String, address: String, tel: String, holiday: String, parking: String, access: String, map: CLLocationCoordinate2D, url: URL){
        
        self.id = id
        self.name = name
        self.image = image
        self.openTime = openTime
        self.closeTime = closeTime
        self.zip = zip
        self.address = address
        self.tel = tel
        self.holiday = holiday
        self.parking = parking
        self.access = access
        self.map = map
        self.url = url
    }
}
