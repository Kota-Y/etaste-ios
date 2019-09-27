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
    
    public var userid: Int64! = 0
    public var storeid: Int64! = 0
    public var storename: String! = ""
    var data1:FavoriteCreate!
    public var isfavorite: Bool!
    var delegate: StoreFavoriteModelDelegate?
    
    
    public func set(userid: Int64, storeid: Int64, storename: String ) {
        self.userid = userid
        self.storeid = storeid
        self.storename = storename
        data1 = FavoriteCreate(userId: userid, storeId: storeid, storeName: storename)
        self.isfavorite = false

    }
    func createFavorite(){
        FavoriteAPI.createFavorite { data1, error in
            if let _ = error {
                print("error")
            } else {
                print("okcreate")
            }
        }
    }
    
    
    func deleteFavorite(){
        FavoriteAPI.deleteFavorite(storeId: storeid) { storeid, error in
            if let _ = error {
                print("error")
            } else {
                print("okdelete")
            }
        }
    }
    
    func getisFavorite() {
        FavoriteAPI.getFavorite(userId: userid){ data, error in
            if let error = error {
                self.delegate?.didRecieveStoreFavoriteError(storeFavoritemodel: self, error: error)
                self.isfavorite = false
            } else {
                self.delegate?.didReceiveStoreFavoriteModel(storeFavoritemodel: self, Favorite: data!)
            }
        }
    }
}

protocol StoreFavoriteModelDelegate {
    
    func didReceiveStoreFavoriteModel(storeFavoritemodel: StoreFavoriteModel, Favorite: Favorite)
    func didRecieveStoreFavoriteError(storeFavoritemodel: StoreFavoriteModel, error: Error)
    
}
