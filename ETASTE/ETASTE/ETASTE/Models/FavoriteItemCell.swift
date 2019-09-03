//
//  FavoriteItemCell.swift
//  ETASTE
//
//  Created by hakuchan on 2019/09/01.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation
class FavoriteItemCell: NSObject{
    var favoriteimage: String
    var id: String
    init (favoriteimage: String,id:String){
        self.favoriteimage = favoriteimage as String
        self.id = id as String
    }
}
