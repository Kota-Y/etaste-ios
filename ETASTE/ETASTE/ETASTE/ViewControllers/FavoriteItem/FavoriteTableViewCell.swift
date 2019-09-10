//
//  FavoriteTableViewCell.swift
//  ETASTE
//
//  Created by hakuchan on 2019/09/01.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    @IBOutlet weak var favoritecellimage: UIImageView!
    @IBOutlet weak var contentview: UIView!
    @IBOutlet weak var celloutlineview: UIView!
    
    @IBOutlet weak var storenamelabel: UILabel!
    @IBOutlet weak var storelocationlabel: UILabel!
    var id: String?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func setCell(item:FavoriteItemCell){
        self.favoritecellimage.image = fgetImageByUrl(url: item.favoriteimagestring)
        self.storenamelabel.text = item.favoritestorename
        self.storelocationlabel.text = item.favoritestorelocation
        self.id = item.id
        cellshadow()
        
    }
    
    func cellshadow(){
       celloutlineview.layer.shadowColor = UIColor.black.cgColor
       celloutlineview.layer.shadowOffset = CGSize(width: 0, height: 2.0)
       celloutlineview.layer.shadowRadius = 2.0
        celloutlineview.layer.shadowOpacity = 0.9
       celloutlineview.layer.masksToBounds = false
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
