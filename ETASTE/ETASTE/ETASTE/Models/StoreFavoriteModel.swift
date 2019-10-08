//
//  File.swift
//  ETASTE
//
//  Created by hakuchan on 2019/09/27.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation



class StoreFavoriteModel {
    
    var delegate: StoreFavoriteModelDelegate?
    
    func getisFavorite(userid: Int64) {
        FavoriteAPI.getFavorite(userId: userid){ data, error in
            if let error = error {
                self.delegate?.didRecieveStoreFavoriteError(storeFavoritemodel: self, error: error)
            } else {
              self.delegate?.didReceiveStoreFavoriteModel(storeFavoritemodel: self, Favorite: data!)
            }
        }
    }
    
    func deleteFavorite(storeid:Int64){
        FavoriteAPI.deleteFavorite(storeId: storeid) { storeid, error in
            if let _ = error {
                print("error")
            } else {
                print("okdelete")
            }
        }
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
    
    
    
}

protocol StoreFavoriteModelDelegate {
    
    func didReceiveStoreFavoriteModel(storeFavoritemodel: StoreFavoriteModel, Favorite: Favorite)
    func didRecieveStoreFavoriteError(storeFavoritemodel: StoreFavoriteModel, error: Error)
    
}
