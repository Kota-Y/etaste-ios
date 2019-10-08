//
//  View.swift
//  ETASTE
//
//  Created by 石黒晴也 on 2019/09/12.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import UIKit

class CustomView: UIView, DesinableView {
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
}

protocol DesinableView {
    func setupStyle()
}

@IBDesignable class RoundedPaleGrayView: CustomView {
    override func setupStyle() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
}

@IBDesignable class RoundedETASTEOrangeiew: CustomView {
    override func setupStyle() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.clear.cgColor
        layer.backgroundColor = UIColor.etasteOrange.cgColor
        layer.cornerRadius = 5
        layer.masksToBounds = true
    }
}

@IBDesignable class RoundedETASTEPaleYellowView: CustomView {
    override func setupStyle() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.clear.cgColor
        layer.backgroundColor = UIColor.etastePaleYellow.cgColor
        layer.cornerRadius = 5
        layer.masksToBounds = true
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowColor = UIColor.paleBlack.cgColor
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.5
    }
}

@IBDesignable class UpperRoundedView: CustomView {
    override func setupStyle() {
        layer.cornerRadius = 20
        layer.masksToBounds = true
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        layer.borderColor = UIColor.etasteGray.cgColor
        layer.borderWidth = 1
    }
}
