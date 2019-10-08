//
//  Animation.swift
//  ETASTE
//
//  Created by 石黒晴也 on 2019/10/09.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation
import MapKit

class Animation {
    
    func animateHalfModalView(imageView: UIImageView, imageName: String, heightConstraint: NSLayoutConstraint, height: CGFloat, withDuration: TimeInterval, uiView: UIView, isDoTransparent: Bool, transparentUIView: UIView, completion: @escaping () -> ()) {
        imageView.image = UIImage(named: imageName)
        heightConstraint.constant = height
        UIView.animate(withDuration: withDuration, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, animations: { [weak self] in
            uiView.layoutIfNeeded()
            transparentUIView.alpha = isDoTransparent ? 0 : 1
        }) { [weak self] _ in
            completion()
        }
    }
    
}
