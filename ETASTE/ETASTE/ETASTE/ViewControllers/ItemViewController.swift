//
//  ItemViewController.swift
//  ETASTE
//
//  Created by 石黒晴也 on 2019/09/12.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation
import UIKit

class ItemViewController: UIViewController {
        
    let foodDetailModel = FoodDetailModel()
    let storeModel = StoreModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "商品購入"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "loginicon")?.withRenderingMode(.alwaysOriginal),
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(login))
        
        foodDetailModel.delegate = self
        storeModel.delegate = self
        
        foodDetailModel.getFoodDetail(foodId: 1) // 暫定の決めうち
        storeModel.getStore(storeId: 1) // 暫定の決めうち
        
    }
    
    
    
    @objc func login() {
        
    }
    
}

extension ItemViewController: FoodDetailModelDelegate {
    func didRecieveFoodDetailData(foodDetailModel: FoodDetailModel, foodDetail: FoodDetail) {
        
    }
    
    func didRecieveFoodDetailError(foodDetailModel: FoodDetailModel, error: Error) {
        print("Error on getFood")
    }
}

extension ItemViewController: StoreModelDelegate {
    func didRecieveStoreData(storeModel: StoreModel, store: Store) {
        
    }
    
    func didRecieveStoreError(storeModel: StoreModel, error: Error) {
        print("Error on getStore")
    }
}
