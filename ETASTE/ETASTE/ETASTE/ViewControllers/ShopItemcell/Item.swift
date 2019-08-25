//
//  item.swift
//  ETASTE
//
//  Created by hakuchan on 2019/08/18.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation

class Item: NSObject{
    var name: String
    var originalPrice: String
    var salePrice: String
    var startTime: String
    var endTime: String
    var image: String
    
    
    init(name: String, originalPrice: String, salePrice: String, startTime: String, endTime : String, image: String){
        self.name = name as String
        self.originalPrice = originalPrice as String
        self.salePrice = salePrice as String
        self.startTime = startTime as String
        self.endTime = endTime as String
        self.image = image as String
    }
}
