//
//  StoreModel.swift
//  ETASTE
//
//  Created by 石黒晴也 on 2019/09/11.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation

protocol StoreModelDelegate {
    func didRecieveStoreData(storeModel: StoreModel, store: Store)
    func didRecieveError(storeModel: StoreModel, error: Error)
}

class StoreModel {
    
    var delegate: StoreModelDelegate?
    
    func getStore(storeId: Int64) {
        StoreAPI.getStore(storeId: storeId) { data, error in
            if let data = data {
                self.delegate?.didRecieveStoreData(storeModel: self, store: data)
            } else if let error = error {
                self.delegate?.didRecieveError(storeModel: self, error: error)
            }
        }
    }

}
