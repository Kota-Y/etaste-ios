//
//  Label.swift
//  ETASTE
//
//  Created by 石黒晴也 on 2019/08/24.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import UIKit


protocol DesinableLabel {
    func setupStyle()
}

class CustomLabel: UILabel, DesinableLabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupStyle()
    }
    
    override func prepareForInterfaceBuilder() {
        setupStyle()
    }
    
    func setupStyle() {
        
    }

    override var text: String? {
        didSet {
            backgroundColor = UIColor.clear
        }
    }
}

@IBDesignable class TextTitlePaleBlackLabel: CustomLabel {
    override func setupStyle() {
        textColor = UIColor.black
        font = UIFont(type: .bold, size: 20)
    }
}

@IBDesignable class TextNormalPaleBlackLabel: CustomLabel {
    override func setupStyle() {
        textColor = UIColor.paleBlack
        font = UIFont(type: .regular, size: 12)
    }
}

@IBDesignable class TextBiggerBlackLabel: CustomLabel {
    override func setupStyle() {
        textColor = UIColor.black
        font = UIFont(type: .bold, size: 21)
    }
}

@IBDesignable class TextNormalBlackLabel: CustomLabel {
    override func setupStyle() {
        textColor = UIColor.black
        font = UIFont(type: .bold, size: 12)
    }
}

@IBDesignable class TextBiggestPaleBlackLabel: CustomLabel {
    override func setupStyle() {
        textColor = UIColor.paleBlack
        font = UIFont(type: .bold, size: 24)
    }
}

@IBDesignable class TextNormalWhiteLabel: CustomLabel {
    override func setupStyle() {
        textColor = UIColor.white
        font = UIFont(type: .bold, size: 13)
    }
}
