//
//  ItemDetailModel.swift
//  ETASTE
//
//  Created by 石黒晴也 on 2019/09/15.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation

protocol FoodDetailModelDelegate {
    func didRecieveFoodDetailData(foodDetailModel: FoodDetailModel, foodDetail: FoodDetail)
    func didRecieveFoodDetailError(foodDetailModel: FoodDetailModel, error: Error)
}

class FoodDetailModel {
    var delegate: FoodDetailModelDelegate?
    
    func getFoodDetail(foodId: Int64) {
        FoodAPI.getFood(foodId: foodId) { data, error in
            if let error = error {
                self.delegate?.didRecieveFoodDetailError(foodDetailModel: self, error: error)
            } else {
                self.delegate?.didRecieveFoodDetailData(foodDetailModel: self, foodDetail: data!)
            }
        }
    }
}


