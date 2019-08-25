//
//  ShopItemCell.swift
//  ETASTE
//
//  Created by hakuchan on 2019/08/18.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import UIKit

class ShopItemCell:  UICollectionViewCell  {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    @IBOutlet weak var Itemimage: UIImageView!
    @IBOutlet weak var Itemname: ShadowAttributeSettableLabel!
    @IBOutlet weak var Itemprice: UILabel!
    @IBOutlet weak var Itemtime: UILabel!
    @IBOutlet weak var cellcontent: UIView!
    
    func setupCell(item: Item){

        self.Itemimage.image = GetUrl().getImageByUrl(url: item.image)
        self.Itemname.text = item.name as String
        setprice(originalPrice: item.originalPrice,salePrice: item.salePrice)
        settime(startTime: item.startTime, endTime: item.endTime)
        cellshadow()
    }
    
   
    
    func setprice(originalPrice: String, salePrice: String){
        let string1 = NSAttributedString(string: originalPrice + "円", attributes:stringAttributes1)
        let string2 = NSAttributedString(string: " → ", attributes: stringAttributes2)
        let string3 = NSAttributedString(string: salePrice, attributes: stringAttributes3)
        let string4 = NSAttributedString(string: "円", attributes: stringAttributes2)
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(string1)
        mutableAttributedString.append(string2)
        mutableAttributedString.append(string3)
        mutableAttributedString.append(string4)
        self.Itemprice.attributedText = mutableAttributedString
    }
    
    func settime(startTime: String, endTime: String){
        var str = startTime
        var ori1:String = String(str.prefix(2))
        var ori2:String = String(str.suffix(2))
        let stime = ori1 + ":" + ori2
        
        str = endTime
        ori1 = String(str.prefix(2))
        ori2 = String(str.suffix(2))
        let etime = ori1 + ":" + ori2
        let time = stime + "〜" + etime
        self.Itemtime.text = ""
        self.Itemtime.text = time
        
    }
    
    func cellshadow(){
        cellcontent.layer.shadowColor = UIColor.black.cgColor
        cellcontent.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cellcontent.layer.shadowRadius = 2.0
        cellcontent.layer.shadowOpacity = 0.9
        cellcontent.layer.masksToBounds = false
    }

    
    let stringAttributes1: [NSAttributedString.Key : Any] = [
        .font : UIFont.systemFont(ofSize: 15.0),
        .strikethroughStyle : true
    ]
    let stringAttributes2: [NSAttributedString.Key : Any] = [
        .font : UIFont.systemFont(ofSize: 15.0)
    ]
    let stringAttributes3: [NSAttributedString.Key : Any] = [
        .foregroundColor : UIColor.red,
        .font : UIFont.boldSystemFont(ofSize: 20.0)
    ]
    
}
