//
//  FavoriteMocel.swift
//  ETASTE
//
//  Created by 石黒晴也 on 2019/08/24.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation
import UIKit

class FavoriteModel {
    
    func createFavorite(label: UILabel) {
        FavoriteAPI.createFavorite { data, error in
            if let _ = error {
                print(error)
                label.text = "error"
            } else {
                //print(data)
                label.text = "success"
            }
        }
    }
    
}
