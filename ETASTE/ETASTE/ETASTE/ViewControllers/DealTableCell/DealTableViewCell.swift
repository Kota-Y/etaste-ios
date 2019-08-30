//
//  DealTableViewCell.swift
//  ETASTE
//
//  Created by hakuchan on 2019/08/28.
//  Copyright © 2019 ETASTE. All rights reserved.
//
import Foundation
import UIKit

class DealTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var itemNum: UILabel!
    @IBOutlet weak var sum: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var storeName: UILabel!
   
    @IBOutlet weak var foodimage: UIImageView!
    
    
    func setupCell(cell:DealTableItem){
        foodimage.layer.borderColor = UIColor.gray.cgColor
        foodimage.layer.borderWidth = 2.0
        name.text = ": " + cell.name
        itemNum.text = ": " + cell.itemNum.description + "個"
        sum.text = ": " + cell.sum.description + "円"
        time.text = ": " + cell.time
        storeName.text = ": " + cell.storeName
        foodimage.image = UIImage(url:cell.image)
    }
    
   
    
}
extension UIImage {
    public convenience init(url: String) {
        let url = URL(string: url)
        do {
            let data = try Data(contentsOf: url!)
            self.init(data: data)!
            return
        } catch let err {
            print("Error : \(err.localizedDescription)")
        }
        self.init()
    }
}
