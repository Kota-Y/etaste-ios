//
//  DealTableItem.swift
//  ETASTE
//
//  Created by hakuchan on 2019/08/28.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation
import UIKit
class DealTableItem: NSObject{
    var id:String
    var name: String
    var itemNum: Int
    var sum: Int
    var time: String
    var storeName: String
    var storeimagestring: String

    
    init(id:String, name: String, itemNum: Int, sum: Int,time: String,storeName:String,storeimagestring: String){
        self.id = id as String
        self.name = name as String
        self.itemNum = itemNum as Int
        self.sum = sum as Int
        self.time = time as String
        self.storeName = storeName as String
        self.storeimagestring = storeimagestring as String
    }
   
    
}

