//
//  UIView_Utility.swift
//  ETASTE
//
//  Created by 石黒晴也 on 2019/09/13.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import UIKit

extension Array where Element == UIImageView {
    func appearImagePlaceHolders() {
        self.forEach { $0.backgroundColor = UIColor.placeHoldersGray }
    }
}

extension Array where Element == UILabel {
    func appearLabelPlaceHolders() {
        self.forEach {
            let attributeText = NSMutableAttributedString(string: $0.text!)
            attributeText.addAttribute(
                NSAttributedString.Key.backgroundColor,
                value: UIColor.placeHoldersGray,
                range: NSMakeRange(0, $0.text!.count)
            )
            attributeText.addAttribute(
                NSAttributedString.Key.foregroundColor,
                value: UIColor.clear,
                range: NSMakeRange(0, $0.text!.count)
            )
            $0.attributedText = attributeText
        }
    }
}
