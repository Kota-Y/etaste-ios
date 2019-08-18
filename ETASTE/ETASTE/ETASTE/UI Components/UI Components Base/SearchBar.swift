//
//  SearchBar.swift
//  ETASTE
//
//  Created by 石黒晴也 on 2019/07/31.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import UIKit

@IBDesignable class SearchBar: UISearchBar {
    
    var textField: UITextField {
        return self.value(forKey: "_searchField") as! UITextField
    }
    
    @IBInspectable var textFieldColor: UIColor = .lightGray {
        didSet { textFieldUpdate() }
    }
    
    @IBInspectable var shadowColor: UIColor = .black {
        didSet { textFieldUpdate() }
    }
    
    @IBInspectable var textFieldHeight: CGFloat = 38 {
        didSet { textFieldUpdate() }
    }
    
    @IBInspectable var textFieldCornerDadius: CGFloat = 18 {
        didSet { textFieldUpdate() }
    }
    
    @IBInspectable var shadowOpacity: Float = 18 {
        didSet { textFieldUpdate() }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 0.0) {
        didSet { textFieldUpdate() }
    }
    
    fileprivate func textFieldUpdate() {
        let image = UIImage.instantiate(size: CGSize(width: UIScreen.main.bounds.size.width, height: textFieldHeight), fillColor: textFieldColor, cornerRadius: textFieldCornerDadius)
        self.setSearchFieldBackgroundImage(image, for: .normal)
        
        self.layer.cornerRadius = textFieldCornerDadius
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = shadowOffset
        self.layer.masksToBounds = false
 
    }
}

extension UIImage {
    static func instantiate(size: CGSize, fillColor: UIColor, cornerRadius: CGFloat) -> UIImage? {
        let rect = CGRect(origin: CGPoint.zero, size: size)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        fillColor.setFill()
        path.fill()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
