//
//  FavoriteItemCell.swift
//  ETASTE
//
//  Created by hakuchan on 2019/09/01.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation
class FavoriteItemCell: NSObject{
    var favoriteimagestring: String
    var favoritestorename: String
    var favoritestorelocation:String
    var id: String
    init (favoriteimagestring: String,favoritestorename:String,favoritestorelocation:String,id:String){
        self.favoriteimagestring = favoriteimagestring as String
        self.favoritestorename = favoritestorename as String
        self.favoritestorelocation = favoritestorelocation as String
        self.id = id as String
    }
}
