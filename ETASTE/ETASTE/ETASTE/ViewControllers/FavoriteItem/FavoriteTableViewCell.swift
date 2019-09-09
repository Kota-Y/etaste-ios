//
//  FavoriteTableViewCell.swift
//  ETASTE
//
//  Created by hakuchan on 2019/09/01.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var favoritecellimage: UIImageView!
  
    @IBOutlet weak var content: UIView!
    var id: String?
   
    
    func setCell(item:FavoriteItemCell){
       self.favoritecellimage.image = fgetImageByUrl(url: item.favoriteimage)
        self.id = item.id
        cellshadow()
        
    }
    
    func cellshadow(){
       content.layer.shadowColor = UIColor.black.cgColor
        content.layer.shadowOffset = CGSize(width: 0, height: 2.0)
       content.layer.shadowRadius = 2.0
        content.layer.shadowOpacity = 0.9
        content.layer.masksToBounds = false
    }
    
    
    @IBAction func detailbutton(_ sender: Any) {
    
    }
    

func fgetImageByUrl(url: String) -> UIImage{
    let url = URL(string: url)
    do {
        let data = try Data(contentsOf: url!)
        return UIImage(data: data)!
    } catch let err {
        print("Error : \(err.localizedDescription)")
    }
    return UIImage()
}
}
