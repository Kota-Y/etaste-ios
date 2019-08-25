//
//  StoreViewController.swift
//  ETASTE
//
//  Created by hakuchan on 2019/08/24.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation
import UIKit

class StoreViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "店舗詳細"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "loginicon")?.withRenderingMode(.alwaysOriginal),
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(login))

        foodItemCollection.dataSource = self
        foodItemCollection.register(UINib(nibName: "ShopItemCell", bundle: nil), forCellWithReuseIdentifier: "ShopItemCell")
        let customLayout = ItemCellLayout()
        customLayout.delegate = self
        foodItemCollection.collectionViewLayout = customLayout
        
        self.setupItem()
        self.setupimage()
        
    }
    @objc func login() {
        
    }
    
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var foodItemCollection: UICollectionView!
    
    var ShopItem:[Item] = [Item]()
    var storeImageurl : String = ""
    
    func setupimage(){
        storeImage.image = GetUrl().getImageByUrl(url: storeImageurl)
    }

    func setupItem(){
        ShopItem = [Item(name: "サンドイッチ", originalPrice: "150",salePrice: "100", startTime: "1813", endTime: "1921", image: "https://dl.dropboxusercontent.com/s/fxss9wae0iq143q/an-pan.jpg"),Item(name: "サンドイッチ", originalPrice: "150",salePrice: "100", startTime: "18:00", endTime: "19:00",image: "https://dl.dropboxusercontent.com/s/fxss9wae0iq143q/an-pan.jpg"),Item(name: "サンドイッチ", originalPrice: "150",salePrice: "100", startTime: "18:00", endTime: "19:00", image: "https://dl.dropboxusercontent.com/s/fxss9wae0iq143q/an-pan.jpg")]

        storeImageurl = "https://dl.dropboxusercontent.com/s/7vyyl6u3h66enwv/takigawa-pan.jpg"
    }
    
    
    
}

extension StoreViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ShopItem.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = foodItemCollection.dequeueReusableCell(withReuseIdentifier: "ShopItemCell", for: indexPath)
        if let cell = cell as? ShopItemCell {
            cell.setupCell(item: ShopItem[indexPath.row])
        }
        return cell
    }
}
extension StoreViewController: CustomDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForItemAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(240)
    }
}
