//
//  StoreFavoriteModel.swift
//  ETASTE
//
//  Created by hakuchan on 2019/09/21.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation
import UIKit

class StoreFavoriteModel {
    
    public var userid: Int64
    public var storeid: Int64
    public var storename: String
    
    
    public init(userid: Int64, storeid: Int64, storename: String ) {
        self.userid = userid
        self.storeid = storeid
        self.storename = storename
        
    
    }
    
    
    
    func createFavorite(label: UILabel) {
        FavoriteAPI.createFavorite { data, error in
            if let _ = error {
                print(error)
                label.text = "error"
            } else {
                //print(data)
                label.text = "success"
            }
        }
    }
    
    
}
