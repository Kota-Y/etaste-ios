//
//  Font.swift
//  ETASTE
//
//  Created by 石黒晴也 on 2019/08/31.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import UIKit

extension UIFont {
    static let jpFont = "HiraginoSans"
    static let enFont = "HiraginoSans"
    
    convenience init?(type: FontType, size: CGFloat) {
        let descriptorJa = UIFontDescriptor(name: "\(UIFont.jpFont)-\(type.rawValue)", size: 0)
        let descriptorEn = UIFontDescriptor(name: "\(UIFont.enFont)-\(type.rawValue)", size: 0)
        descriptorEn.addingAttributes([.cascadeList: [descriptorJa]])
        self.init(descriptor: descriptorEn, size: size)
    }
}

public enum FontType: String {
    case regular = "W3"
    case bold = "W6"
}
