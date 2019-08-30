//
//  DealButton.swift
//  ETASTE
//
//  Created by hakuchan on 2019/08/27.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation
import UIKit
class Deallabel: UIView{
    
    
    @IBOutlet weak var labeltext: UILabel!
    @IBOutlet weak var labelout: UILabel!
  
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        loadFromNib()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib()
    }
    
    private func loadFromNib() {
        let v = UINib(nibName: "Deallabel", bundle: Bundle(for: Deallabel.self)).instantiate(withOwner: self, options: nil)[0] as! UIView
        v.frame = self.bounds
        addSubview(v)
        
    }
    
    override func prepareForInterfaceBuilder() {
        loadFromNib()
       
    }
    
    func setuplabel(state:Bool,title:String){
       labelstate(state: state)
        labeltext.text = title
    }
    func settinglabel(){
//        labeloutline.layer.cornerRadius = 15
//        labeloutline.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//        labeloutline.layer.borderWidth = 2.0
        
    }
    
    func labelstate(state:Bool){
        settinglabel()
        if state == true{
            labelout.backgroundColor = UIColor.etasteYellow
            labeltext.backgroundColor = UIColor.etasteDarkerYellow
            //labelunder.backgroundColor = UIColor.white
//            labeloutline.layer.borderColor = UIColor.etasteYellow.cgColor
//            labeloutline.layer.borderWidth = 2.0
        }else{
            labelout.backgroundColor = UIColor.gray
            labeltext.backgroundColor = UIColor.gray
//            labelunder.backgroundColor = UIColor.etasteYellow
//            labeloutline.layer.borderColor = UIColor.gray.cgColor
//            labeloutline.layer.borderWidth = 2.0
            
        }
    }
    
}
