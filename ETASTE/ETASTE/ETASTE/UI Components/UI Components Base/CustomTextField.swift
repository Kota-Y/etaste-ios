//
//  CustomTextField.swift
//  ETASTE
//
//  Created by hakuchan on 2019/09/06.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    
    // 下線用のUIViewを作っておく
    let underline: UIView = UIView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame.size.height = 30 // ここ変える
        composeUnderline() // 下線のスタイルセットおよび追加処理
      
    }
    
    private func composeUnderline() {
        self.underline.frame = CGRect(
            x: 0,                    // x, yの位置指定は親要素,
            y: self.frame.height,    // この場合はCustomTextFieldを基準にする
            width: self.frame.width,
            height: 1)
        self.underline.backgroundColor = UIColor.darkGray
        self.addSubview(self.underline)
        self.bringSubviewToFront(self.underline)
    }
  
}
