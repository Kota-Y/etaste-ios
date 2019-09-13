//
//  DealAleart.swift
//  ETASTE
//
//  Created by hakuchan on 2019/09/10.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import UIKit

protocol DealAlertDelegate {
    func okTapped(_ alert:DealAlert)
}

class DealAlert: UIView {
    var dealAlert:UIView!
    var parentView:UIView!
    var topView:UIView!
    var underView:UIView!
    var leftView:UIView!
    var rightView:UIView!
    var aroundOpacity:Float = 0.2
    
    var delegate:DealAlertDelegate?
    
    
    @IBAction func ok(_ sender: Any) {
        delegate?.okTapped(self)
    }
    
    @IBAction func cancel(_ sender: Any) {
         self.dism()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func prepare(frame: CGRect, bgColor: UIColor,aroundOpacity:Float = 0.2) {
        
        dealAlert = Bundle.main.loadNibNamed("DealAlert", owner: self, options: nil)?.first as? UIView
        
        dealAlert.backgroundColor = bgColor
        dealAlert.layer.shadowOffset = CGSize(width:5,height:5)
        
        let app = UIApplication.shared.delegate as! AppDelegate
        parentView = app.window?.rootViewController?.view
        
        dealAlert.center = parentView.center
        
    }
    
    func open(aroundAreaTappable:Bool = true) {
        // アラートView
        parentView?.addSubview(dealAlert)
        
        // 上部余白エリア
        let topViewFrame = CGRect(x:0,y:0,width:(UIScreen.main.bounds.size.width),height:(dealAlert.frame.origin.y))
        topView = UIView(frame:topViewFrame)
        topView.backgroundColor = UIColor.black
        topView.layer.opacity = aroundOpacity
        let tapGesTop:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DealAlert.dism))
        if aroundAreaTappable { topView.addGestureRecognizer(tapGesTop) }
        parentView?.addSubview(topView)
        
        // 下部余白エリア
        let underViewPos = CGPoint(x:0,y:(topView.frame.height + dealAlert.frame.height))
        let underViewSize = CGSize(width:UIScreen.main.bounds.size.width,height:topView.frame.height)
        let underViewFrame = CGRect(origin: underViewPos, size: underViewSize)
        underView = UIView(frame:underViewFrame)
        underView.backgroundColor = UIColor.black
        underView.layer.opacity = aroundOpacity
        let tapGesUnder = UITapGestureRecognizer(target: self, action: #selector(DealAlert.dism))
        if aroundAreaTappable { underView.addGestureRecognizer(tapGesUnder) }
        parentView?.addSubview(underView)
        // 左余白エリア
        let leftViewPos = CGPoint(x:0,y:(topView.frame.height))
        let leftViewSize = CGSize(width:(UIScreen.main.bounds.size.width/2)-(dealAlert.frame.width/2) , height:dealAlert.frame.height)
        let leftViewFrame = CGRect(origin:leftViewPos,size:leftViewSize)
        leftView = UIView(frame:leftViewFrame)
        leftView.backgroundColor = UIColor.black
        leftView.layer.opacity = aroundOpacity
        let tapGesLeft:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DealAlert.dism))
        if aroundAreaTappable { leftView.addGestureRecognizer(tapGesLeft) }
        parentView?.addSubview(leftView)
        
        // 右余白エリア
        let rightViewPos = CGPoint(x:(leftView.frame.width + dealAlert.frame.width) , y:topView.frame.height)
        let rightViewSize = CGSize(width:leftView.frame.width,height:leftView.frame.height)
        let rightViewFrame = CGRect(origin:rightViewPos,size:rightViewSize)
        rightView = UIView(frame:rightViewFrame)
        rightView.backgroundColor = UIColor.black
        rightView.layer.opacity = aroundOpacity
        let tapGesRight:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DealAlert.dism))
        if aroundAreaTappable { rightView.addGestureRecognizer(tapGesRight) }
        parentView?.addSubview(rightView)
        
    }

        
    @objc private func dism() {
        topView.removeFromSuperview()
        underView.removeFromSuperview()
        leftView.removeFromSuperview()
        rightView.removeFromSuperview()
        dealAlert.removeFromSuperview()
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
