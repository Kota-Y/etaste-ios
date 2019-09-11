//
//  UIImage.swift
//  ETASTE
//
//  Created by 石黒晴也 on 2019/09/11.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation
import UIKit

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
