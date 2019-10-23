//
//  ShopItemCell.swift
//  ETASTE
//
//  Created by 中野柊人 on 2019/10/22.
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
    
//    override init(frame: CGRect){
//           super.init(frame: frame)
//           loadNib()
//    }
//    
//   required init(coder aDecoder: NSCoder) {
//       super.init(coder: aDecoder)!
//       loadNib()
//   }
//    
//   func loadNib(){
//       let view = Bundle.main.loadNibNamed("ShopItemCell", owner: self, options: nil)?.first as! UIView
//       view.frame = self.bounds
//       self.addSubview(view)
//   }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    



}
