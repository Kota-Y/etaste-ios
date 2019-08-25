//
//  ShopItem.swift
//  ETASTE
//
//  Created by hakuchan on 2019/08/14.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation
import UIKit

class ShopItem:UITableViewCell{
    
    @IBOutlet weak var ItemView: UIImageView!
    
    @IBOutlet weak var ItemTitle: UILabel!
    @IBOutlet weak var ItemPrice: UILabel!
    @IBOutlet weak var ItemTime: UILabel!
    
    let Itemtitle: String = ""
    let ItemPrice1: Int = 0
    let ItemPrice2: Int = 0
    let ItemTime1: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
}

