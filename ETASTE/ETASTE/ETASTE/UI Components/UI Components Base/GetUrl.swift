//
//  GetUrl.swift
//  ETASTE
//
//  Created by hakuchan on 2019/08/25.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation
import UIKit

class GetUrl: UIImage{
    func getImageByUrl(url: String) -> UIImage{
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
