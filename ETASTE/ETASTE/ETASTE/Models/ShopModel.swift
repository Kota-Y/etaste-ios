//
//  ShopModel.swift
//  ETASTE
//
//  Created by hakuchan on 2019/07/30.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation
import GoogleMaps

class ShopModel {
    var latitude: CLLocationDegrees?// = 36.579909//36.559007
    var longitude: CLLocationDegrees?// = 136.643436 //= 136.652444//
    var shopnumber: Int?
    
    init(latitude:Double ,longitude:Double){
        self.latitude = CLLocationDegrees(latitude)
        self.longitude = CLLocationDegrees(longitude)
       
    }
    
}
