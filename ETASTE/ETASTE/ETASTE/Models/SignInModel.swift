//
//  SignInModel.swift
//  ETASTE
//
//  Created by hakuchan on 2019/09/09.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import Foundation
import UIKit
class SignInModel{
    
    var isloginable:Bool?
    
   func startSignIn(loginuser:UserLogin,label:UILabel) {
       // label.text = "start"
        UserAPI.loginUser{ loginuser, error in
            if let _ = error {
                //print(error)
                label.text = "ログインできません"
                self.isloginable = false
            } else {
                //print(data)
                //print("ok")
                //label.text = "ok"
                self.isloginable = true
              
            }
        }
    }
}
